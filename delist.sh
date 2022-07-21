#!/bin/bash

read -p "Enter the domain that you want to delist:" domain

if [ "$domain" == "" ]; then
    echo "No domain provided."
    exit
else
  if [ "$domain" == "v" ]; then
      echo "Wrong paste command."
      exit
  fi

  if [ "$domain" == "[A[A" ]; then
      echo "syntax error [A[A."
      exit
  fi


  read -p "Specify reason (required):" reason


  if [ "$reason" == "" ]; then
      echo "No reason provided."
      exit
  fi


  declare blocklist="./blocklist.txt"
  declare piholeBlocklist="./pihole-blocklist.txt"

  declare domain=$(echo $domain | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://.
  declare domain=$(echo $domain | sed 's:/*$::') # remove any trailing slash.

  declare blocklistRule="||$domain^"
  declare piholeBlocklistRule="0.0.0.0 $domain"


  # Only check for default blocklist as pihole list should contain same domains.
  if grep -q $blocklistRule "$blocklist"; then
      echo "checking for updates..."
      git pull origin master && git pull github master

      if grep -q $blocklistRule "$blocklist"; then
          sed -i '' "s/$blocklistRule/@@$blocklistRule  # $reason/g" $blocklist
          sed -i '' "s/$piholeBlocklistRule/! allow $domain reason: $reason/g" $piholeBlocklist
          python3 ./ls-delete.sh $domain
          git commit -am "delisted $domain in blocklist" && git push origin master && git push github master
      else
            echo "$domain rule delisted before you"
      fi
  else
      echo "$domain domain not present"
  fi
fi
