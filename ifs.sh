#!/bin/bash
file=/etc/passwd

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! -f $file ]
then
    echo -e "${R}ERROR:: File $file does not exist ${N}"
else
    echo -e "${G}File $file exists ${N}"
fi

while IFS=":" read -r username password userid groupid user_fullname home_directory shell
do
    echo -e "${Y}Username: ${N}$username"
    echo -e "${Y}User ID: ${N}$userid"
    echo -e "${Y}Group ID: ${N}$user_fullname"
    
done < $file