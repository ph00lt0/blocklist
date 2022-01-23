#!/bin/bash


read -p "Enter the domain that you want to add:" domain

if [ "$domain" != "" ]; then
      printf "||$domain^\n" >> './stats-analytics.txt'
fi
