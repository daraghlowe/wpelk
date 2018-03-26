#!/bin/bash
# Description: An example file to teach some things on variables, echo and printf

# You define a variable like below, the $ before the variable name should not be used when defining the value:
variable1="apples"
variable2="oranges"

# The commands echo or printf can be used to print to screen
# When you want to use a variable, you add a $ before the name you defined
echo "I love me some $variable1"

# It's good practice to enclose the varable name in {} when using them in echo/printf statements
# The curly brackets define the start and end of the variable name
# If you didn't use {} in the example below, the '.' would be included in the variable name
echo "I love me some ${variable1}."

# Here's an example of using printf,
# The %s will be replaced with the variable value
# Unlike echo, printf doesn't automatically include a 'nextline', this is done with \n
printf "I love me some %s and some %s.\n" "$variable1" "$variable2"


# Special variables
# $0 - The name of the Bash script.
# $1 - $9 - The first 9 arguments to the Bash script.
# $# - How many arguments were passed to the Bash script.
# $@ - All the arguments supplied to the Bash script.
# $? - The exit status of the most recently run process.
# $$ - The process ID of the current script.
# $USER - The username of the user running the script.
# $HOSTNAME - The hostname of the machine the script is running on.
# $SECONDS - The number of seconds since the script was started.
# $RANDOM - Returns a different random number each time is it referred to.
# $LINENO - Returns the current line number in the Bash script.

# The most commonly used special variables will be the command line arguments $1 to $9.
# You can use these variables to pass in different parameters each time you run a script.

# Here is an example of how that would look at the command line and how you would use those variables
# bash variables_and_printing.sh pears peaches bananas
echo "I love me some ${1}, ${2} and ${3}."

# You would usually redefine the command line variables so they are more readable
cli_var_fruit1="$1"
cli_var_fruit2="$2"
cli_var_fruit3="$3"

# Same example using printf
printf "I love me some %s, %s and %s.\n" "$cli_var_fruit1" "$cli_var_fruit2" "$cli_var_fruit3"
