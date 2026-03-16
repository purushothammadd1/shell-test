#!/bin/bash

ID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "Script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [$1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILED $N"
    else
        echo -e "$2 ... $G SUCCESS $N"
}
if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N"
    exit 1 #you can give other than 0
else
    echo -e "$G You are root user $N"
fi #fi means reverse of if, indicating condition end

# echo "All arguments passed:: $@"
for package in $0
do
    yum list installed $package &>> $LOGFILE #check installed or not
    if [ $? -ne 0 ] #if not installed 
    then
        yum install $package -y &>> $LOGFILE #install the package
        VALIDATE $? "Installation of $package" #validate
    else
        echo -e "$package is already installed... $Y Skipping $N"
    fi
done