#!/bin/sh

grabserial -d "/dev/cu.usbmodem14101" -e 30 -t -n > output.log
vi output.log
