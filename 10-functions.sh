#!/bin/bash

ID=$(id -u)

VALIDATE() {
if [ $1 -ne 0 ]
then
 echo "Installation $2 failed"
else
 echo "Installation $2 success"
fi
}

if [ $ID -ne 0 ]
then
 echo " Run with root user"
 exit 1
else
 echo "you are root user"
fi

yum install mysql -y

VALIDATE $? "MYSQL"

yum install gilt -y

VALIDATE $? "GIT"