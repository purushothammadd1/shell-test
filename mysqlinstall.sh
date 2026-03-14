#!/bin/bash

ID=$(id -u)

if [$ID -ne 0]
then
    echo "ERROR:: Please run this script with root access"
else
    echo "Your root user is accessed"
fi