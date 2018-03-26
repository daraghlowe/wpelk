#!/bin/bash
# Description: An example file to teach some things on variables, echo and printf

# Set some readable names for cli arguments that we will use in our script
cli_var_fruit1="$1"
cli_var_fruit2="$2"
cli_var_fruit3="$3"

# Here's an example of an if statement that is used for checking to make sure we entered three cli arguments
# The script will exit if three cli arguments were not passed
# -z = check if the variable is empty/zero
# || = boolean OR
# ; = command seperator, could be replaced by putting then on a new line
if [ -z "$cli_var_fruit1" ] || [ -z "$cli_var_fruit2" ] || [ -z "$cli_var_fruit3" ]; then
  echo "Usage: scriptname.sh fruitname1 fruitname2 fruitname3"
  exit 1
else
  echo "You did it right!"
  exit 1
fi


# Same example using printf
printf "I love me some %s, %s and %s.\n" "$cli_var_fruit1" "$cli_var_fruit2" "$cli_var_fruit3"
