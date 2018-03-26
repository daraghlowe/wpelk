#!/bin/bash
# Description: Move your api call into a function


#Pull our api key from
API_KEY=$(cat secrets)

#Store the ID of what we are querying
ID="2962941"

function make_api_call(){
  #Make our call and store the result in a variable (-s means silent to avoid unneeded transfer stats)
  RESULT=$(curl -s "http://api.openweathermap.org/data/2.5/forecast?id=${ID}&APPID=${API_KEY}")

  #Print the result and parse it through jq to parse the json into readable format
  echo $RESULT | jq
}

make_api_call
