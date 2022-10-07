#!/bin/bash

## Main script, will randomly ouput a txt file from the txt folder with lolcat
## The script stop when pressing ctrl+c

trap "exit" INT
tput rmam
trap 'tput smam' EXIT
while true
do
	for i in $(ls ~/.asciidle/txt/*.txt | shuf -n 1)
	do
		lolcat $i -af -d 2
	done
done
