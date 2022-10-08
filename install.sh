#!/bin/bash

if [[ `grep -c "##ASCIIDLE" ~/.bashrc` -gt 0 ]]; then
        sed -i '/##ASCIIDLE/,/##ASCIIDLE/d' ~/.bashrc
fi

printf "Close the terminal(s) and launch installation on a fresh one for best results."
read -r -s -n 1 -p ""

# Verbose mode with -n

if [[ "$1" == "-v" ]]; then

set -x

fi

# Dependencies installation

if ! command -v lolcat >/dev/null 2>&1; then
  echo "Installing lolcat"
  sudo apt-get install lolcat
fi

if ! command -v xprintidle >/dev/null 2>&1; then
  echo "Installing xprintidle"
  sudo apt-get install xprintidle
fi

sudo apt-get update -y #; sudo apt-get upgrade -y
chmod 775 asciidle.sh

# Asciidle alias creation

if [ ! -f ~/.bash_aliases ]; then
    touch ~/.bash_aliases
fi

# If a asciidle alias already exists it will be replaced

if [ -e ~/.bash_aliases ]; then
    sed -i '/alias asciidle/d' ~/.bash_aliases
    echo "alias asciidle='bash ~/.asciidle/asciidle.sh'" >> ~/.bash_aliases
fi

# If there's no asciidle alias it will create one

if ! grep -q "asciidle='bash ~/.asciidle/asciidle.sh'" ~/.bash_aliases; then
    echo "alias asciidle='bash ~/.asciidle/asciidle.sh'" >> ~/.bash_aliases
fi

# Activate alias

source ~/.bash_aliases

# Create a temporary alias, permanent alias may only activate after reboot

#alias asciidle='bash ~/.asciidle/asciidle.sh'

#Auto config script for the .basrc file


a=$(ps -o command | grep -v command | wc -l)

if [[ -z "$(grep '##ASCIIDLE' ~/.bashrc)" ]]; then
  b=$((a+1))
else
  b=$((a-1))
fi



printf "##ASCIIDLE\n" >> ~/.bashrc

printf "\nAfter how much time should asciidle start (in seconds)?"
read time
time=$((time*1000))
printf  '\nwhile true \n do \n sleep 5 \n if [ $(xprintidle)' >> ~/.bashrc
printf " -gt $time ]" >> ~/.bashrc
printf "Only start asciidle if there's nothing running in the terminal (experimental). Yes or no? (y/n) "
read response

if [ "$response" = "n" ]; then
    yesorno="#"
else
    yesorno=""
fi
printf " $yesorno&&" >> ~/.bashrc
printf ' [[ $(ps -o command | grep -v command | wc -l) -lt' >> ~/.bashrc
printf " $b ]]" >> ~/.bashrc
printf '\nthen \n ~/.asciidle/asciidle.sh \n fi \n done &\n' >> ~/.bashrc

printf "\n##ASCIIDLE\n" >> ~/.bashrc

printf "Do you want to add Pinups to the txt folder? Yes or no? (y/n) "
read response

if [ "$response" = "y" ]; then
for i in {00..48}
do
  wget https://asciipr0n.com/pr0n/pinups/pinup$i.txt
done
mv pinup*.txt ~/.asciidle/txt
fi



    echo "Close and reopen the terminal(s) for all changes to apply!!!"


##Restart Shell

source ~/.bashrc
exec bash




