#!/bin/sh

if [ -z $1 ]; then
	length=10 #seconds
else
	length=$1
fi

./record.sh $length
./process.sh
