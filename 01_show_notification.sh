#!/bin/bash

# Set space as the delimiter
IFS=' '
#Read the split words into an array based on space delimiter
read -a strarr <<< "$1"


numSeconds="${strarr[0]}"
msg="${strarr[@]:1}"

echo "$numSeconds | $msg"

if [ "$numSeconds" == "" ]; then
    echo "you need to pass a timestamp!"
    exit 1
else
	sleep $numSeconds
fi

#timer

messageText="" 

if [ ! "" == "$msg" ]; then messageText=" message \"$msg\""; fi

osascript -e "display alert \"Your timer has passed\"$messageText"

exit 0