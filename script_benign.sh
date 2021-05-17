#!/bin/bash

IFS=
count=0
input="benign_urls.txt"
while IFS= read -r line
do
   echo "$line"
   echo "x" | timeout 1 openssl s_client -connect "$line":443 </dev/null > benign_data/$line
done < "$input"