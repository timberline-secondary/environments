#!/bin/python
import subprocess
import re
import sys

RED = '\033[1;31m'
GREEN = '\033[1;32m'
MAGENTA = '\033[1;32m'
NC = '\033[0m'

MAP_TO_OUTPUT_PARAMS = "MapToOutput 1920x1200+0+0"


def not_found():
    print(f"{RED}Sorry, I didn't recognise any tablets.{NC}\nAre you sure it is plugged in and powered?  Can you see the lights on the tablets?")
    sys.exit()


devices_list = subprocess.run(['/usr/bin/xsetwacom', '--list'], text=True, capture_output=True).stdout

if not devices_list:
    not_found()

# If found, should get something like this:
# Wacom Intuos Pro M Pen stylus          id: 10  type: STYLUS
# Wacom Intuos Pro M Pen eraser           id: 11  type: ERASER
# Wacom Intuos Pro M Pen cursor           id: 12  type: CURSOR
# Wacom Intuos Pro M Pad pad              id: 20  type: PAD
# Wacom Intuos Pro M Finger touch         id: 21  type: TOUCH

possible_devices = ["STYLUS", "ERASER", "CURSOR", "PAD", "TOUCH"]
devices_to_map = ["STYLUS", "ERASER", "CURSOR"]

stylus_device = re.findall("^.*type: STYLUS", devices_list, re.MULTILINE)[0]
tablet_name = re.match('(?:(?! Pen ).)*', stylus_device).group(0).strip()
if not tablet_name:
    not_found()

print(f"Tablet found: {GREEN}{tablet_name}{NC}")

for possible_device in possible_devices:
    if possible_device in devices_list:
        device = re.findall(f"^.*type: {possible_device}", devices_list, re.MULTILINE)[0]

        # get everything in the string up to the id:
        # https://stackoverflow.com/questions/3850074/regex-until-but-not-including
        device_name = re.match('(?:(?!id: ).)*', device).group(0).strip()
        device_name = device_name.group(0).strip()
        if device_name and possible_device in devices_to_map:
            result = subprocess.run(['xsetwacom', '--set', device_name, MAP_TO_OUTPUT_PARAMS], text=True, capture_output=True).stdout
            if result == '':
                print(f"{possible_device} has been mapped to the left-most monitor.")
            else:
                print(f"{RED}Failed to map the {possible_device}.{NC}")
