#!/bin/bash

read -p "Enter the domain that you want to add: " domain

declare blocklist="./blocklist.txt"

declare domain=$(echo $domain | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://.
declare domain=$(echo $domain | sed 's:/*$::') # remove any trailing slash.

read -p "Enter the class that you want to remove: " class

read -p "Enter the element the class should be removed from: " elm

declare blocklistRule="${domain}##+js(rc, ${class}, ${elm}, stay)"

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

if [ "$class" == "" ]; then
    echo "No class provided"
    exit
fi

if [ "$elm" == "" ]; then
    echo "No element provided"
    exit
fi

# Only check for default blocklist as pihole list should contain same domains.
if grep -q "$blocklistRule" "$blocklist"; then
        echo "Rule already present"
    else
        echo "checking for updates..."
        git pull origin master && git pull github master

        if grep -q "$blocklistRule" "$blocklist"; then
            echo "This rule has already been added before you"
        else
            printf "$blocklistRule\n" >> "$blocklist"
            git commit -am "block class ${class} on ${elm} for $domain" && git push origin master && git push github master
        fi
fi

