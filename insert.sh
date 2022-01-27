#!/bin/bash

# Update before adding domain
git pull origin master && git pull github master

read -p "Enter the domain that you want to add:" domain

declare file="./blocklist.txt"
declare rule="||$domain^"

if grep -q $rule "$file"; then
        echo "$domain rule already present"
    else
        if [ "$domain" != "" ]; then
            printf "$rule\n" >> "$file"
            git commit -am "added $domain to blocklist" && git push origin master && git push github master
            echo "added $domain"
        else
            echo "no domain provided"
        fi
fi

