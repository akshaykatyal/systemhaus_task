#!/bin/bash


# Please enter the url/api uri that needs to be monitored
URL=http://www.google.de/

# Getting the reponse for running the URL
RESPONSE=$(curl -o headers.txt --connect-timeout 5 --silent --head --write-out '%{http_code}\n' $URL)

if [ "$RESPONSE" != 200 ] 
then
  echo "$URL is not correct, error code $RESPONSE"

else
  cat headers.txt
  cat headers.txt | head -n 1 | cut '-d ' '-f2'
fi
