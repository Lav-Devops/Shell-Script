#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
 echo " Run with root user"
 exit 1
else
 echo "you are root user"
fi

yum install mysql -y

if [ $? -ne 0 ]
then
 echo "Installation failed"
else
 echo "Installation success"
fi