#!/bin/bash
IFS=
count=0
input="phish_urls.txt"
while IFS= read -r line
do
   echo "$line"
   #timeout 1 echo { $(openssl s_client -showcerts -servername google.com -connect "$line":443 </dev/null) > "phish_data3/$line" }
   #openssl s_client -showcerts -servername google.com -connect "$line":443  -sess_out "phish_data3/$line" </dev/null
   echo "x" | timeout 1 openssl s_client -connect "$line":443 </dev/null > phish_data-08-05/$line
done < "$input"