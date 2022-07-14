#!/bin/bash

read -p "Enter the domain that you want to add:" domain


if [[ $domain == *","* ]]; then
    echo "You are trying to add multiple domains"
    echo "This is not supported for third party domains"
    exit
fi

declare blocklist="./blocklist.txt"
declare piholeBlocklist="./pihole-blocklist.txt"

declare domain=$(echo $domain | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://.
declare domain=$(echo $domain | sed 's:/*$::') # remove any trailing slash.

declare version=$(date +"%Y%m%d")
declare versionTag="! Version: "
declare versionLine="! Version: $version"

declare tag='$third-party'
declare piholeBlocklistRule="0.0.0.0 $domain"
declare blocklist3pRule="||$domain^$tag"
declare allowedRule="@@||$domain^"
declare blocklistRule="||$domain^"

if [ "$domain" == "" ]; then
    echo "No domain provided."
    exit
fi

if [ "$domain" == "v" ]; then
    echo "Wrong paste command."
    exit
fi

if [ "$domain" == "[A[A" ]; then
    echo "syntax error [A[A."
    exit
fi

echo "Third party domains will only be blocked in certains apps, therefore general domains are preferred"
echo "If the domain can't be blocked because it's breaking functionality in a third party app state this as the reason"
read -p "Specify reason you want to block this only as third party (required):" reason

if [ "$reason" == "" ]; then
    echo "No reason provided."
    exit
fi

# If blocklist rule exists replace with allow rule
if ! grep -q -x -F "$blocklistRule" "$blocklist"; then    
    sed -i '' "s/$blocklistRule/@@$blocklistRule  # $reason/g" $blocklist
    sed -i '' "s/$piholeBlocklistRule/! allow $domain reason: $reason/g" $piholeBlocklist
    echo "whitelisted domain as first party"
# Else if allowed rule is not there yet add it
elif ! grep -q -x -F "$allowedRule" "$blocklist"; then    
    printf "$allowedRule # $reason/g \n" >> "$blocklist"
    echo "added whitelisted domain"
fi

# Only check for default blocklist as pihole list should contain same domains.
if grep -q $blocklist3pRule "$blocklist"; then 
        echo "$domain rule already present"
    else
        echo "checking for updates..."
        git pull origin master && git pull github master
        
        if grep -q $blocklist3pRule "$blocklist"; then
            echo "$domain rule added before you"
        else    
            sed -i '' "s/$versionTag.*/$versionLine/g" $blocklist 
            printf "$blocklist3pRule\n" >> "$blocklist"
#            git commit -am "added $domain to blocklist as third party" && git push origin master && git push github master
        fi
fi

