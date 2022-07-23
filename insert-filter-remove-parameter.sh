#!/bin/bash

declare blocklist="./blocklist.txt"

read -p "Enter the parameter that you want to remove on all domains: " param

declare blocklistRule="\$removeparam=${param}"

echo $blocklistRule

if [ "$param" == "v" ]; then
    exit
fi

if [ "$param" == "[A[A" ]; then
    echo "syntax error [A[A."
    exit
fi

if [ "$param" == "" ]; then
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
            git commit -am "remove parameter ${param}" && git push origin master && git push github master
        fi
fi

