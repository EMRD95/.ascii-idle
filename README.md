# .asciidle
Simple Shell script to display ASCII art in the terminal when idle.

Can be used as a linux terminal "screensaver" (increases CPU load a bit) or directly from the asciidle script.

ASCII art must be stored in the txt folder with a .txt format.

The script pick up .txt files randomly and display them on the terminal vertically.

Exit with ctrl + c

The auto install script will creates an alias to run the script from "asciidle" or start it when you're idle for x amount of time. There's some hack to to not start it on top of an other interfaced process. The install.sh script can be run an unlimited amount of time to change configurations.

# Installation

git clone to the home/user folder.

cd ~/.asciidle

bash install.sh

Follow instructions.

>Close the terminal(s) and launch installation on a fresh one for best results.

It's better if you start the install script on a freshly opened terminal.

>After how much time should asciidle start (in seconds)?

Set required time in seconds. To start asciidle after 10 minutes idle write 600 then press Enter.

>Only start asciidle if there's nothing running in the terminal (experimental).

Will only start asciidle if ps -t return a value less than the ps -t + 1 from a fresh terminal.

>Do you want to add Pinups to the txt folder?

Populate the txt folder with ASCII art from https://asciipr0n.com/pr0n/pinups.html

>Close and reopen the terminal(s) for all changes to apply!!!

Your .bashrc profile file must be reload, best way is to close and reopen the terminal.

The script is very simple so you can also set it up yourself the way you want manually.

Tested on Debian and Ubuntu.

![alt text](https://files.catbox.moe/klulg5.jpg)

# Details

Asciidle uses lolcat and xprintidle as dependencies, will install from the script.

Asciidle uses xprintidle to start the script when the user is idle for x amount of times (no keyboard input detected).

Asciidle also calculates how many processes run normally on a newly opened terminal, and will not start if more processes are running to avoid hiding and losing current work. It is based on the current tty, so you can have multiple terminals open and asciidle will only start in the unused ones.
It's an experimental feature that can be disabled, seems to works fine for now.

Asciidle can also configure on top of which processes it shouldn't start. By default asciidle will not start on top of apt-get.

Asciidle is configured in the user profile, so it will only start from the user with which you installed asciidle and not system wide.
