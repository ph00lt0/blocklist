#!/bin/bash

declare blocklist="./blocklist.txt"

read -p "Enter the path (full url) of the file: " path

declare path=$(echo $path | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://.
declare path=$(echo $path | sed 's:/*$::') # remove any trailing slash.

declare blocklistRule="||${path}^"
echo $blocklistRule

if [ "$path" == "v" ]; then
    exit
fi

if [ "$path" == "[A[A" ]; then
    echo "syntax error [A[A."
    exit
fi

if [ "$path" == "" ]; then
    echo "No parameter provided"
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
            git commit -am "block ${path}" && git push origin master && git push github master
        fi
fi
