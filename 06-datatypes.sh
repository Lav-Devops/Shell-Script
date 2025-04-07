#!/bin/bash

NUMBER1=$1
NUMBER2=$2

SUM=$(($NUMBER1 + $NUMBER2))

echo "total: $SUM"

echo "all args passed $@"

echo "script name $0"

echo "Total args passed $#"