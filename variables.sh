#!/bin/bash

# USERNAME=$1
echo "please enter your username::"
read -s USERNAME #the value entered above will be automatically attached to Username variable
# PASSWORD=$2

# echo "username is: $USERNAME" #i am printing just for validation, you should not print username and passwords in scripts.

echo "Please enter your Password::"
read -s PASSWORD
echo "username is: $USERNAME,password is: $PASSWORD"