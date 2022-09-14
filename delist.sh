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
  declare rpzBlocklist="./rpz-blocklist.txt"
  declare unboundBlocklist="./unbound-blocklist.txt"

  declare domain=$(echo $domain | sed -E 's/^\s*.*:\/\///g') # remove any https:// or http://.
  declare domain=$(echo $domain | sed 's:/*$::') # remove any trailing slash.
  declare domain=$(echo $domain | sed 's/www.//g') # remove www. if present.
  
  declare blocklistRule="||$domain^"
  declare allowedRule="||$domain^\$badfilter"
  declare piholeBlocklistRule="0.0.0.0 $domain"
  declare rpzBlocklistRule="$domain CNAME ."
  declare unboundBlocklistRule="local-zone: \"$domain.\" always_null"

  # Only check for default blocklist as pihole list should contain same domains.
  if grep -q $blocklistRule "$blocklist"; then
      echo "checking for updates..."
      git pull origin master && git pull github master

      if grep -q $allowedRule "$blocklist"; then
            echo "$domain rule delisted before you"
      else
            sed -i '' "s/$blocklistRule/$allowedRule  # $reason/g" $blocklist
            sed -i '' "s/$piholeBlocklistRule/! allow $domain reason: $reason/g" $piholeBlocklist
            sed -i '' "s/$rpzBlocklistRule/; allow $domain reason: $reason/g" $rpzBlocklist
            sed -i '' "s/$unboundBlocklistRule/# allow $domain reason: $reason/g" $unboundBlocklist
            python3 ./ls-delete.py $domain
           git commit -am "delisted $domain in blocklist" && git push origin master && git push github master
      fi
  else
      echo "$domain domain not present"
  fi
fi
