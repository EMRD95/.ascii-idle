#!/bin/bash

## 60000 = 60 seconds, asciidle will start after 60 seconds if set to 60000

while :
do
	idle=`xprintidle`
	if [ $idle -gt 60000 ]
	then
		bash asciidle.sh
	fi
done
