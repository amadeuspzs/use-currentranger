#!/bin/sh

if [ -z $1 ]; then
	length=10 #seconds
else
	length=$1
fi

grabserial -d "/dev/cu.usbmodem14101" -e $1 -t -n > output.log
vi output.log
