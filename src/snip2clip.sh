#!/bin/bash

workdir=`dirname $0`
cd $workdir
workdir=`pwd`
snipfile=$workdir/snippets.txt

snip=$( sed -r '/^#|^\s*$/d' "$snipfile" | sort | sed -n $1p )

printf '%s' "$snip" | xclip -i -selection clipboard 

# current=`cat "/proc/$(xdotool getwindowpid "$(xdotool getwindowfocus)")/comm"`
# xdotool search --name $current type $snip
sleep 0.001
# xdotool key 'Shift+Insert'
xdotool key 'ctrl+shift+v'




# printf '%s' "$snip" | xclip -i -selection clipboard 
