#!/bin/bash
MOTDS=("Tetris is the GOAT." "Petition for morbius role!" "Hello, my name is Matthew Baker, I am currently trapped inside this computer, please send help I don't think Mr. C is sane." "Enjoy your time here!" "Today will be a day!" "Human children are lame" "We found the one piece. I won't say where." "Don't play 27 on the theme player" "Heresy" "Nothing bad is going to happen November 6, 2025" "2023" "Hello young scholar" "I hope the iPhone notch is gone" "idk" "Nutter Butter!" "What's that on the wall?" "I can see." "I love asparagus" "Fun fact: ANSI sucks." "I am alive" "<INSERT MOTD HERE>" "// TODO" "The original NES version of Tetris was technically a pirated port" "Tetris was the first video game played in space." "The tetris theme is actually a 19-th century Russian folk song" "Theoretically, using an algorithm it is possible to play one game of Tetris forever" "Dad jokes are the best jokes" "Stop! I'm trying to sleep." "Python? More like schmython" "where were you when club penguin is kill?" "https://youtu.be/GtL1huin9EE")

echo "Thanks for checking the Hackerspace's Message Of The Day!"

day=$( date +%d )
cowsay -f h10-motd.cow "${MOTDS[ day - 1 ]}"