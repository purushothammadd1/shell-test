#!/bin/bash

ID=$(id -u)

validate(){
    if [ $? -ne 0 ]
    then
        echo "ERROR:: Installing MySQL is failed"
        exit 1
    else
        echo "Installing MYSQL is Success"
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

validate

yum install git -y

validate