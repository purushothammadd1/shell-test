#!/bin/bash

ID=$(id -u)

echo "script name: $0"
TIMESTAMP=$(date +%F-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"

LOG_FILE="/tmp/$0-$TIMESTAMP.log"

validate(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2 ... $R failed $N"
        exit 1
    else
        echo " $2 ... $G Success $N"
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1 #you can give other than 0
else
    echo "Your root $G user is accessed $N"
fi #fi means reverse of if, indicating condition end

yum install mysql -y &>> $LOG_FILE 

validate $? "Installing MySQL"

yum install git -y &>> $LOG_FILE 

validate $? "Installing GIT"