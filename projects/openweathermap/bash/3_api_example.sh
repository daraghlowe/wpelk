#!/bin/bash
# Description: Add case to allow cli args

#Pull our api key from
API_KEY=$(cat secrets)

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

#Check if the city matches info we have available
if [ "$CITY" == "Limerick" ];then
  ID="2962941"
fi

function make_api_call(){
  #Make our call and store the result in a variable (-s means silent to avoid unneeded transfer stats)
  RESULT=$(curl -s "http://api.openweathermap.org/data/2.5/forecast?id=${ID}&APPID=${API_KEY}")

  #Print the result and parse it through jq to parse the json into readable format
  echo $RESULT | jq
}

make_api_call
