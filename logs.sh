#!/bin/bash

ID=$(id -u)

echo "script name: $0"

# LOG_FILE=/tmp/

validate(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2 ... failed"
        exit 1
    else
        echo " $2 ... Success"
    fi
}

if [ $ID -ne 0 ]
then
    echo "ERROR:: Please run this script with root access"
    exit 1 #you can give other than 0
else
    echo "Your root user is accessed"
fi #fi means reverse of if, indicating condition end

yum install mysql -y 

validate $? "Installing MySQL"

yum install git -y

validate $? "Installing GIT"