#!/bin/bash

read -p "Enter the domains, comma seperated, you wish to add:" domains

declare blocklist="./blocklist.txt"
declare piholeBlocklist="./pihole-blocklist.txt"

if [ "$domains" == "" ]; then
    echo "No domain provided."
    exit
fi

echo "Checking for updates..."
git pull origin master && git pull github master

echo "Start bulk insertion"
for domain in ${domains//,/ }; do
    declare domain=$(echo $domain | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://.
    declare domain=$(echo $domain | sed 's:/*$::') # remove any trailing slash.
    declare rpzBlocklist="./rpz-blocklist.txt"
    declare unboundBlocklist="./unbound-blocklist.txt"

    declare blocklistRule="||$domain^"
    declare allowedRule="@@||$domain^"
    declare piholeBlocklistRule="0.0.0.0 $domain"
    declare rpzBlocklistRule="$domain CNAME ."
    declare unboundBlocklistRule="local-zone: \"$domain.\" always_null"

    # Only check for default blocklist as pihole list should contain same domains.
    if grep -q $allowedRule "$blocklist"; then
        echo "${domain} whitelisted"
        return
    fi

    # Only check for default blocklist as pihole list should contain same domains.
    if grep -q $blocklistRule "$blocklist"; then
        echo "$domain rule already present"
    else
        python3 ./ls-insert.py $domain
        printf "$blocklistRule\n" >> "$blocklist"
        printf "$piholeBlocklistRule\n" >> "$piholeBlocklist"
        printf "$rpzBlocklistRule\n" >> "$rpzBlocklist"
        printf "$unboundBlocklistRule\n" >> "$unboundBlocklist"
    fi
done
git commit -am "added domains in bulk to blocklist" && git push origin master && git push github master
