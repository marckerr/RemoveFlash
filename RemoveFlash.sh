#!/bin/bash

# This script removes Adobe FlashPlayer as well as preferences that may
# be in the users home directory. Use this script as you see fit. This
# script may not work as you expect so please test. There is no warranty
# or guarantee. By using this script you accepte the consequences of its
# actions. If you find a problem with this script say so in the issues.

# last edit 2020_01_24

removeThis=("/Library/Application Support/Macromedia" \
			"/Library/Application Support/Adobe/Flash Player Install Manager" \
			"/Library/Internet Plug-Ins/Flash Player.plugin" \
			"/Library/Internet Plug-Ins/flashplayer.xpt" \
			"/Library/Internet Plug-Ins/PepperFlashPlayer" \
			"/Library/LaunchDaemons/com.adobe.fpsaud.plist" \
			"/Library/PreferencePanes/Flash Player.prefPane" \
			"/Applications/Utilities/Adobe Flash Player Install Manager.app")

for removeThis in "${removeThis[@]}" ; do
	if [ -e "$removeThis" ] ; then
		echo "Removing $removeThis"
		rm -rf "$removeThis"
	fi
done

# Check for the two directories in each user home directorie and remove them
for folder in /Users/*; do
    user=$(basename "${folder}")
    # compare folder name against the array items
    if [ -e "/Users/${user}/Library/Preferences/Macromedia/Flash Player" ]; then
    	echo "Removing /Users/${user}/Library/Preferences/Macromedia/Flash Player"
        rm -rf "/Users/${user}/Library/Preferences/Macromedia/Flash Player"
    fi
    if [ -e "/Users/${user}/Library/Caches/Adobe/Flash Player" ]; then
    	echo "Removing /Users/${user}/Library/Caches/Adobe/Flash Player"
        rm -rf "/Users/${user}/Library/Caches/Adobe/Flash Player"
    fi
    
done