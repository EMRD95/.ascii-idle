#!/bin/bash


if [[ "$1" == "-v" ]]; then

set -x

fi

# dependencies installation

if ! command -v lolcat >/dev/null 2>&1; then
  echo "Installing lolcat"
  sudo apt-get install lolcat
fi

if ! command -v xprintidle >/dev/null 2>&1; then
  echo "Installing xprintidle"
  sudo apt-get install xprintidle
fi

sudo apt-get update -y ; sudo apt-get upgrade -y

# asciidle alias creation

if [ ! -f ~/.bash_aliases ]; then
    touch ~/.bash_aliases
fi

# if a asciidle alias already exists it will be replaced

if [ -e ~/.bash_aliases ]; then
    sed -i '/alias asciidle/d' ~/.bash_aliases
    echo "alias asciidle='bash ~/.asciidle/asciidle.sh'" >> ~/.bash_aliases
fi

# if there's no asciidle alias it will create one

if ! grep -q "asciidle='bash ~/.asciidle/asciidle.sh'" ~/.bash_aliases; then
    echo "alias asciidle='bash ~/.asciidle/asciidle.sh'" >> ~/.bash_aliases
fi

# activate alias

source ~/.bash_aliases

# create a temporary alias, permanent alias may only activate after reboot

alias asciidle='bash ~/.asciidle/asciidle.sh'

#run asciidle in the bash terminal at all time, time is in milliseconds, 60000=1m 600000=10m

if grep -q "while true
do

if [[ $(xprintidle) -gt 5000 ]]
then
bash ~/.asciidle/asciidle.sh
sleep 5
fi

done &" ~/.bashrc; then

    echo "Script is already in .bashrc"

else

    echo 'while true
do

if [[ $(xprintidle) -gt 5000 ]]
then
bash ~/.asciidle/asciidle.sh
sleep 5
fi

done &' >> ~/.bashrc

    echo "Script added to .bashrc"
fi

echo "$(tput setaf 1) exit and relaunch the terminal for all changes to apply"
