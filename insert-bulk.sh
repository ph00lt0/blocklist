#!/bin/bash

read -p "Enter the domains, comma seperated, you wish to add:" domains

declare blocklist="./blocklist.txt"
declare piholeBlocklist="./pihole-blocklist.txt"

declare version=$(date +"%Y%m%d")
declare versionTag="! Version: "
declare versionLine="! Version: $version"

if [ "$domains" == "" ]; then
    echo "No domain provided."
    exit  
fi

echo "Checking for updates..."
git pull origin master && git pull github master
sed -i '' "s/$versionTag.*/$versionLine/g" $blocklist 

echo "Start bulk insertion"
for domain in ${domains//,/ }; do
    declare domain=$(echo $domain | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://.
    declare domain=$(echo $domain | sed 's:/*$::') # remove any trailing slash.

    declare blocklistRule="||$domain^" 
    declare allowedRule="@@||$domain^"    
    declare piholeBlocklistRule="0.0.0.0 $domain"
    
    # Only check for default blocklist as pihole list should contain same domains.
    if grep -q $allowedRule "$blocklist"; then 
        echo "${domain} whitelisted"
        return
    fi

    # Only check for default blocklist as pihole list should contain same domains.
    if grep -q $blocklistRule "$blocklist"; then 
        echo "$domain rule already present"
    else
        printf "$blocklistRule\n" >> "$blocklist"
        printf "$piholeBlocklistRule\n" >> "$piholeBlocklist" 
        python3 ./ls-insert.py $domain
    fi
done

git commit -am "added domains in bulk to blocklist" && git push origin master && git push github master
