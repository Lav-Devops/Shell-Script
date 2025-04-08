#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>>LOGFILE

VALIDATE() {
    if [ $1 -ne 0 ]
    then 
     echo "$2 ... Failed"
    else
     echo " $2.... Success"
    fi
}

if [ $ID -ne 0 ]
then
 echo " Run with root user"
 exit 1
else 
 echo " you are root user"
fi

for package in $@
do
   yum list installed $package &>> $LOGFILE
   if [ $? -ne 0 ]
   then
    yum install $package -y &>> $LOGFILE
    VALIDATE $? "Installation of $package"
   else 
    echo "$package is already installed"
   fi 
done