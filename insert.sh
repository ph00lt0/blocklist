#!/bin/bash


read -p "Enter the domain that you want to add:" domain

declare file="./stats-analytics.txt"
declare regex="\s+$domain\s+"

declare file_content=$( cat "${file}" )
if [[ " $file_content " =~ $regex ]]
    then
        echo "$domain already present"
    else
        if [ "$domain" != "" ]; then
            printf "||$domain^\n" >> "$file"
            git commit -am "update blocklist" && git push origin master && git push github master
            echo "added $domain"
        else
            echo "no domain provided"
        fi
fi

