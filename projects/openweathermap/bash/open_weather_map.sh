#!/bin/bash
#Description: Bash file for interacting with the open weather map API

#Pull our api key from secrets file
API_KEY=$(cat secrets)
CITY_LIST_FILE="city.list.json"

function get_city_id_from_json(){
  # This function accepts two arguments in the format "get_city_id_from_json Limerick IE".
  # Pass in the city and country and the function returns the city id found in the city.list.json file
  CITY_NAME=$1
  COUNTRY_CODE=$2
  
  CITY_ID=$(jq --arg CITY_NAME "${CITY_NAME}" --arg COUNTRY_CODE "${COUNTRY_CODE}" '.[] | select(.name | match($CITY_NAME;"i")) | select(.country | match($COUNTRY_CODE;"i")) | .id' $CITY_LIST_FILE)
  echo $CITY_ID
}
