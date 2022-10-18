#!/bin/bash
declare -a MOTDS
mapfile -t MOTDS < ./site/profile/files/config/h10-motd.txt

echo "Thanks for checking the Hackerspace's Message Of The Day!"

day=$( date +%d )
cowsay -f ./site/profile/files/config/h10-motd.cow "${MOTDS[ day - 1 ]}"