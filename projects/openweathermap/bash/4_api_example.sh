#!/bin/bash
# Description: Add case to allow cli args

#Pull our api key from
API_KEY=$(cat secrets)
CITY_LIST_FILE="city.list.json"
COUNTRY_CODE="IE"

#Loop while we still have cli args to process
while [[ $# -gt 0 ]] && [[ ."$1" = .--* ]] ;
do
    opt="$1";
    shift;              #expose next argument
    case "$opt" in
        "--" ) break 2;;
        "--city" )
           CITY="$1"; shift;;
        "--city="* )     # alternate format: --city=Limerick
           CITY="${opt#*=}";;
        *) echo >&2 "Invalid option: $@"; exit 1;;
   esac
done

function get_city_id_from_json(){
  # This function accepts two arguments in the format "get_city_id_from_json Limerick IE".
  # Pass in the city and country and the function returns the city id found in the city.list.json file
  CITY_NAME=$1

  CITY_ID_TEMP=$(jq --arg CITY_NAME "${CITY_NAME}" --arg COUNTRY_CODE "${COUNTRY_CODE}" '.[] | select(.name | match($CITY_NAME;"i")) | select(.country | match($COUNTRY_CODE;"i")) | .id' $CITY_LIST_FILE)
  CITY_ID=$(echo $CITY_ID_TEMP | awk '{print $1}')
}

function make_api_call(){
  #Make our call and store the result in a variable (-s means silent to avoid unneeded transfer stats)
  RESULT=$(curl -s "http://api.openweathermap.org/data/2.5/forecast?id=${CITY_ID}&APPID=${API_KEY}")

  #Print the result and parse it through jq to parse the json into readable format
  echo $RESULT | jq
}

get_city_id_from_json $CITY
make_api_call
