#!/bin/bash

declare blocklist="./blocklist.txt"

read -p "Enter the filename that you want to block on all domains: " filename

declare version=$(date +"%Y%m%d")
declare versionTag="! Version: "
declare versionLine="! Version: $version"

declare blocklistRule="^${filename}^"

echo $blocklistRule

if [ "$filename" == "v" ]; then
    exit
fi

if [ "$filename" == "[A[A" ]; then
    echo "syntax error [A[A."
    exit
fi

if [ "$filename" == "" ]; then
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
            sed -i '' "s/$versionTag.*/$versionLine/g" $blocklist 
            
            printf "$blocklistRule\n" >> "$blocklist"
            git commit -am "block filename ${filename}" && git push origin master && git push github master
        fi
fi

