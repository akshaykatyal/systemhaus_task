#!/bin/bash

# Date to monitor the downtime
DATE=$(date)
# Please enter the URL/API URI that needs to be monitored
URL=http://www.googe.de/

# Getting the reponse for running the URL, also checking the downtime
RESPONSE=$(curl -o headers.txt --connect-timeout 5 --silent --head --write-out '%{http_code}\n' $URL)

# conditions for the response for the URL/API
if [ "$RESPONSE" != 200 ] 
then
# output is the URL/API is not working or down for the time
  echo "$URL is not correct, error code $RESPONSE"
# restarting the service using the systemctl command
sudo systemctl reload Basissystem.service
# Getting the output date and notifiaction for service restart
echo "$DATE - $URL - NOT OKAY, service restarted" 

else
  # if the service is UP and running, getting the headers
  cat headers.txt
  cat headers.txt | head -n 1 | cut '-d ' '-f2'

fi