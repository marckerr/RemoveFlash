#!/bin/bash

# Using the Flash Player Install Manager tool is a better method for removing flash.
# Thanks to the Neal on the MacAdmins # adobe Slack

# last edit 2020_01_24

# Try running the official removal tool first.
if [ -e "/Applications/Utilities/Adobe Flash Player Install Manager.app/Contents/MacOS/Adobe Flash Player Install Manager" ] ; then
/Applications/Utilities/Adobe\ Flash\ Player\ Install\ Manager.app/Contents/MacOS/Adobe\ Flash\ Player\ Install\ Manager -uninstall
fi

# Now lets check to be sure all the files got removed or if the Install Manager is missing this will remove things.
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

# Last check for the two directories in each user directory and remove them because the install manager doesn't
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