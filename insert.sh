#!/bin/bash

read -p "Enter the domain that you want to add:" domain

if [[ $domain == *","* ]]; then
    echo "You are trying to add multiple domains"
    echo "Start bulk insertion"
    ./insert-bulk.sh
    exit
fi

declare blocklist="./blocklist.txt"
declare piholeBlocklist="./pihole-blocklist.txt"

declare domain=$(echo $domain | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://.
declare domain=$(echo $domain | sed 's:/*$::') # remove any trailing slash.

declare version=$(date +"%Y%m%d")
declare versionTag="! Version: "
declare versionLine="! Version: $version"

declare blocklistRule="||$domain^"
declare allowedRule="@@||$domain^"
declare piholeBlocklistRule="0.0.0.0 $domain"

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

# Only check for default blocklist as pihole list should contain same domains.
if grep -q $allowedRule "$blocklist"; then 
    echo "domain whitelisted"
    exit
fi

# Only check for default blocklist as pihole list should contain same domains.
if grep -q $blocklistRule "$blocklist"; then 
        echo "$domain rule already present"
    else
        echo "checking for updates..."
        git pull origin master && git pull github master
        
        if grep -q $blocklistRule "$blocklist"; then
            echo "$domain rule added before you"
        else    
            sed -i '' "s/$versionTag.*/$versionLine/g" $blocklist 
            python3 ./ls-insert.py $domain
            printf "$blocklistRule\n" >> "$blocklist"
            printf "$piholeBlocklistRule\n" >> "$piholeBlocklist" 
            git commit -am "added $domain to blocklist" && git push origin master && git push github master
        fi
fi

