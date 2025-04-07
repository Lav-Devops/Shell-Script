#!/bin/bash

ID=$(id -u)

VALIDATE() {
if [ $? -ne 0 ]
then
 echo "Installation failed"
else
 echo "Installation success"
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

VALIDATE

yum install git -y

VALIDATE