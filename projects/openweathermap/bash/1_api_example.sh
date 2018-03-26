#!/bin/bash
# Description: A simple example of how to interact with an API

#Pull our api key from
API_KEY=$(cat secrets)

#Store the ID of what we are querying
ID="2962941"

#Make our call and store the result in a variable (-s means silent to avoid unneeded transfer stats)
RESULT=$(curl -s "http://api.openweathermap.org/data/2.5/forecast?id=${ID}&APPID=${API_KEY}")

#Print the result and parse it through jq to parse the json into readable format
echo $RESULT | jq
