#!/bin/bash
RED='\033[1;31m'
NC='\033[0m'

# Map Intuos5 Medium to single monitor and maintain aspect ratio (1200 instead of 1080)
if xsetwacom --list | grep -q 'Wacom Intuos5 touch M'; then
  xsetwacom --set "Wacom Intuos5 touch M Pen stylus" MapToOutput 1920x1200+0+0
  xsetwacom --set "Wacom Intuos5 touch M Pen eraser" MapToOutput 1920x1200+0+0
  xsetwacom --set "Wacom Intuos5 touch M Pen cursor" MapToOutput 1920x1200+0+0
  echo -e "I found a ${RED}Wacom Intuos5 touch M${NC} tablet"
  echo "This tablet has been mapped to the left-most monitor"
elif xsetwacom --list | grep -q 'Wacom Intuos5 Pro M'; then
  # Intuos Pro Medium
  xsetwacom --set "Wacom Intuos Pro M Pen stylus" MapToOutput 1920x1200+0+0
  xsetwacom --set "Wacom Intuos Pro M Pen eraser" MapToOutput 1920x1200+0+0
  xsetwacom --set "Wacom Intuos Pro M Pen cursor" MapToOutput 1920x1200+0+0
  echo -e "I found a ${RED}Wacom Intuos5 touch M${NC} tablet"
  echo "This tablet has been mapped to the left-most monitor"
else
  echo "Sorry, I didn't find any tablets that I recognized."
fi
