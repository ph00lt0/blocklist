#!/bin/bash

read -p "Enter the domain that you want to remove a cookie from: " domain

declare blocklist="./blocklist.txt"

declare domain=$(echo $domain | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://.
declare domain=$(echo $domain | sed 's:/*$::') # remove any trailing slash.
declare domain=$(echo $domain | sed 's/www.//g') # remove www. if present.

read -p "Enter the reference name of the cookie you want to remove: " ref_cookie

declare blocklistRule="${domain}##+js(cookie-remover, ${ref_cookie})"

echo $blocklistRule

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

if [ "$ref_cookie" == "" ]; then
    echo "No cookie reference name provided"
    exit
fi

if grep -q "$blocklistRule" "$blocklist"; then
        echo "Rule already present"
    else
        echo "checking for updates..."
        git pull origin master && git pull github master

        if grep -q "$blocklistRule" "$blocklist"; then
            echo "This rule has already been added before you"
        else
            printf "$blocklistRule\n" >> "$blocklist"
            git commit -am "remove cookie ${ref_cookie} for $domain" && git push origin master && git push github master
        fi
fi

