#!/bin/bash
declare -a MOTDS
mapfile -t MOTDS < /usr/local/bin/h10-motd.txt

echo "Thanks for checking the Hackerspace's Message Of The Day!"

day=$( date +%d )
cowsay -f /usr/local/bin/h10-motd.cow "${MOTDS[ ${day#0} - 1 ]}"