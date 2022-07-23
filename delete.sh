#!/bin/bash

echo "This is not for delisting domains, please use ./delist.sh"
read -p "Enter the mistake entry that you want to delete:" mistake

if [ "$mistake" == "" ]; then
    echo "No mistake entry provided."
    exit
fi

if [ "$mistake" == "v" ]; then
    echo "Wrong paste command."
    exit
fi

if [ "$mistake" == "[A[A" ]; then
    echo "syntax error [A[A."
    exit
fi

declare blocklist="./blocklist.txt"
declare piholeBlocklist="./pihole-blocklist.txt"
declare rpzBlocklist="./rpz-blocklist.txt"
declare unboundBlocklist="./unbound-blocklist.txt"

declare mistake=$(echo $mistake | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://.
declare mistake=$(echo $mistake | sed 's:/*$::') # remove any trailing slash.

declare author=$(git config user.name)

declare blocklistRule="||$mistake^"
declare piholeBlocklistRule="0.0.0.0 $mistake"
declare rpzBlocklistRule="$mistake CNAME ."
declare unboundBlocklistRule="local-zone: \" $mistake .\" always_null"


# Only check for default blocklist as pihole list should contain same domains.
if grep -q $blocklistRule "$blocklist"; then
    echo "checking for updates..."
    git pull origin master && git pull github master

    if grep -q $blocklistRule "$blocklist"; then
        sed -i '' "/$blocklistRule/d" $blocklist
        sed -i '' "/$piholeBlocklistRule/d" $piholeBlocklist
        sed -i '' "/$rpzBlocklistRule/d" $rpzBlocklist
        sed -i '' "/$unboundBlocklistRule/d" $unboundBlocklist
        python3 ./ls-delete.py $domain
        git commit -am "Mea culpa, $author made a mistake: $mistake now removed from blocklist" && git push origin master && git push github master
    else
          echo "$domain rule corrected before you"
    fi
else
    echo "$domain mistake not present"
fi
