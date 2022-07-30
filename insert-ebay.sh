#!/bin/bash
read -p "Enter the tld that you want to add:" tld


declare blocklist="./blocklist.txt"
declare piholeBlocklist="./pihole-blocklist.txt"

declare countryCode=$(echo $tld | sed 's/.*\.//') # remove .com, .co etc

declare domains=(
    "pulsar.ebay.${tld}"
    "edgetrksvc.ebay.${tld}"
    "ocsrest.ebay.${tld}"
    "devicebind.ebay.${tld}"
    "backstory.ebay.${tld}"
    "rover.ebay.${tld}"
    "cgi6.ebay.${tld}"
    "sofe.ebay.${tld}"
    "srv.${countryCode}.ebayrtm.com"
)

for domain in "${domains[@]}"; do
    echo $domain
    declare blocklistRule="||$domain^"
    declare allowedRule="||$domain^\$badfilter"
    declare piholeBlocklistRule="0.0.0.0 $domain"

    # Check whitelist
    if grep -q $allowedRule "$blocklist"; then
        echo "$domain whitelisted"
        continue
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
            printf "$blocklistRule\n" >> "$blocklist"
            printf "$piholeBlocklistRule\n" >> "$piholeBlocklist"
        fi
    fi
done

git commit -am "added ebay $tld to blocklist" && git push origin master && git push github master

