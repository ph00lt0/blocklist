#!/bin/bash

read -p "Enter the domain that you want to add:" domain

declare file="./blocklist.txt"

declare domain=$(echo $domain | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://
declare domain=$(echo $domain | sed 's:/*$::') # remove any trailing slash

declare rule="||$domain^"

if grep -q $rule "$file"; then
        echo "$domain rule already present"
    else
        echo "checking for updates..."
        git pull origin master && git pull github master
        
        if grep -q $rule "$file"; then
            echo "$domain rule added before you"
        else    
            if [ "$domain" != "" ]; then
               printf "$rule\n" >> "$file"
               git commit -am "added $domain to blocklist" && git push origin master && git push github master
               echo "added $domain"
            else
               echo "no domain provided"
            fi
        fi
fi

