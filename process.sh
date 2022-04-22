#!/bin/sh

echo "timestamp,current" > output.csv
sed -e 's/[][]//g' -e 's/ /,/g' output.log >> output.csv
