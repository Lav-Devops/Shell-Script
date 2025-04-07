#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 18 ]
then 
  echo " $NUMBER is greater that 18"
else 
  echo "$NUMBER is less that 18"
fi