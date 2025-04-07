#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

VALIDATE() {
if [ $1 -ne 0 ]
then
 echo -e "Installation $2 \e[31m failed"
else
 echo -e "Installation $2 \e[32m success"
fi
}

if [ $ID -ne 0 ]
then
 echo -e " \e[31m Run with root user"
 exit 1
else
 echo -e " \e[32m you are root user"
fi

yum install mysql -y &>> $LOGFILE

VALIDATE $? "MYSQL"

yum install git -y &>> $LOGFILE

VALIDATE $? "GIT"