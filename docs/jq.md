# JQ - Json parser

###### Why use JQ
Json files aren't very readable without processing in a json filter like JQ. JQ allows you to return values within your json based on the filter you specify. A common use case for JQ is parsing the json returned by an API.

###### How to install
You can install jq on your macbook with [brew](https://brew.sh/):
```
brew install jq
```

###### What is a JQ filter
For the purposes of this doc, a JQ filter is everything between the single quotes that define the start and end points of your filter.

###### What is an expression
An expression is a part of your filter that refines the data in some way. Your filter may be made up of multiple expressions to produce the desired result.

###### What is an array
An array is a collection of objects, this is a typical means of using JQ as a filter to return the required attributes.

###### What is an attribute
An object can be made up of multiple attributes, in which values can be stored similar to variables. They can be thought of as descriptors of the values they store.

###### Simple use cases
The example below is the simplest means to use jq, this will neatly format a json file into a readable format:
```
jq . city.list.json
```

When you use [], this tells JQ to return all the parsed json as an array which can then be further parsed.
```
jq '.[]' city.list.json
```

You can also return single array elements, ranges and other fancy things described in more detail [here](https://stedolan.github.io/jq/manual/#Basicfilters).
```
jq '.[0]' city.list.json

{
  "id": 707860,
  "name": "Hurzuf",
  "country": "UA",
  "coord": {
    "lon": 34.283333,
    "lat": 44.549999
  }
}
```

###### Pipes
The | in jq work similarly to linux pipes, once they are enclosed within the '' they are recognised as jq pipes rather than shell pipes.
The command below show how you can return the value of an object:
```
jq '.[0] | .id' city.list.json

707860
```

###### Select Expressions
Select can be used to find values of objects in your array that match your search pattern. For example if you wanted to find all of the elements in the array whose name field matches Limerick, you could do so like this:
```
jq '.[] | select(.name | match("Limerick"))' city.list.json
```

JQ supports [regex](https://stedolan.github.io/jq/manual/#RegularexpressionsPCRE) , one example of how it can be used is to make your string match case insensitive:
```
  jq '.[] | select(.name | match("limerick";"i"))' city.list.json
{
  "id": 6054138,
  "name": "Limerick",
  "country": "CA",
  "coord": {
    "lon": -106.267883,
    "lat": 49.650059
  }
}
{
  "id": 2962941,
  "name": "County Limerick",
  "country": "IE",
  "coord": {
    "lon": -8.75,
    "lat": 52.5
  }
}
```

You can pipe the output of one expression into another expression to further refine the output:
```
jq '.[] | select(.name | match("limerick";"i")) | select(.country | match("IE"))' city.list.json

{
  "id": 2962941,
  "name": "County Limerick",
  "country": "IE",
  "coord": {
    "lon": -8.75,
    "lat": 52.5
  }
}
```

To return only the value of one of the attributes in an object/s you would do so as follows:
```
jq '.[] | select(.name | match("limerick";"i")) | select(.country | match("IE")) | .id' city.list.json
2962941
```

###### Variables
To use variables within a jq query, you must use --arg to define your variables. The command below returns the names of all the cities in Ireland:
```
jq --arg COUNTRY_CODE "${country_code}" '.[] | select(.country | match($COUNTRY_CODE)) | .name' city.list.json
```

###### Notes
* More info on jq: https://stedolan.github.io/jq/manual/
* The city.list.json download link: http://bulk.openweathermap.org/sample/
* Free access API to practice with: http://www.openweathermap.org/api
