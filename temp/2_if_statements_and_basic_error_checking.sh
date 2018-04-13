#!/bin/bash
# Description: An example file to teach some things about if statements and error checking
# Note: Some of the error checking is redundant, its just there for demonstration purposes

# Set some readable names for cli arguments that we will use in our script
cli_var_fruit1="$1"
cli_var_fruit2="$2"
cli_var_fruit3="$3"

# Create a variable with the number of cli variables entered
len_cli_var="$#"


# IF STATEMENTS
# Basic IF statement:
# if [ condition_is true ];then
# do_something
# fi
# -z = check if the variable is empty/zero
# || = boolean OR


# Here's an example of an if statement that is used for checking to make sure we entered three cli arguments
# The script will exit if three cli arguments were not passed
if [ -z "$cli_var_fruit1" ] || [ -z "$cli_var_fruit2" ] || [ -z "$cli_var_fruit3" ]; then
  # Exit is used to exit the script without exiting further code
  # The number specified is up to you and can be used as an error code for troubleshooting

  echo "Usage: scriptname.sh fruitname1 fruitname2 fruitname3"
  echo "Possible choice are: ${array_of_fruits[*]}"
  exit 1
fi

# Check if the number of command line variables entered matches what we are expecting, otherwise exit
if [ $len_cli_var != 3 ];then
  echo "You entered the wrong number of arguments"
  echo "Usage: scriptname.sh fruitname1 fruitname2 fruitname3"
  echo "Possible choice are: ${array_of_fruits[*]}"
  exit 1
fi

# Same example using printf
printf "I love me some %s, %s and %s.\n" "$cli_var_fruit1" "$cli_var_fruit2" "$cli_var_fruit3"
