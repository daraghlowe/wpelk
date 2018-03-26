#!/bin/bash
# Description: An example file to teach some things on variables, echo and printf
# Note: Some of the error checking is redundant, its just there for demonstration purposes

# ARRAYS
# The syntax for using arrays is as follows:
# ${array[*]} = all elements in the array
# ${array[1]} = first element in the array, replace number for other elements
# ${#array[@]} = the number of elements in the array
# ${array[@]:0:3} = a range of elements in the array


# Set some readable names for cli arguments that we will use in our script
array_of_cli_fruits=($1 $2 $3 $4)
echo ${array_of_cli_fruits[*]}
len_array_of_cli_fruits=${#array_of_cli_fruits[@]}
last_array_of_cli_fruits=$(($len_array_of_cli_fruits-1))

# Create an array of values
array_of_fruits=(apples oranges pears bananas lemons pineapple kiwi)
# Define a variable that has the number of elements in the array
len_array_of_fruits=${#array_of_fruits[@]}
last_array_of_fruits=$(($len_array_of_fruits-1))


# Here's an example of a for loop, we want to loop through each element in our array
# and check if the cli arguments entered match our approved list of values
for i in $(seq 0 $last_array_of_fruits); do


  for j in $(seq 0 $last_array_of_cli_fruits); do
    echo "Hello"


  done

done
