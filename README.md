# .asciidle
Simple Shell script to display ascii art in the terminal when idle.

Can be used as a linux terminal "screensaver" (increases CPU load a bit) or directly from the asciidle script.

Ascii art must be stored in the txt folder with a .txt format.

The script pick up .txt files randomly and display them on the terminal vertically.

Exit with ctrl + c

Auto install script available, it creates an alias to run the script from "asciidle" or start it when you're idle for x amount of time. There's some hack for it to not start on top of an other interfaced process. The install.sh script can be run an unlimited amount of time to change configurations.

# Installation

git clone to the home/user folder.

cd ~/.asciidle

bash install.sh

Follow instructions.

The script is very simple so you can also set it up yourself the way you want manually.

Tested on Debian and Ubuntu.

![alt text](https://files.catbox.moe/klulg5.jpg)

# Details

Asciidle uses lolcat and xprintidle as dependencies, will install from the script.

Asciidle uses xprintidle to start the script when the user is idle for x amount of times (no keyboard input detected).

Asciidle also calculates how many processes run normally on a newly opened terminal, and will not start if more processes are running to avoid hiding and losing current work.
It's an experimental feature that can be disabled, seems to works fine for now.

Asciidle can also configure on top of which processes it shouldn't start. By default asciidle will not start on top of apt-get.
