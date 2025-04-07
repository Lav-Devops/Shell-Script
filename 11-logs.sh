#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE() {
if [ $1 -ne 0 ]
then
 echo -e "$R ERROR: $N Installation $2  $R failed $N"
else
 echo -e "Installation $2 $G success $N"
fi
}

if [ $ID -ne 0 ]
then
 echo -e "$R Run with root user $N"
 exit 1
else
 echo -e "$Y you are root user $N"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "GIT"