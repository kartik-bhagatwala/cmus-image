#!/bin/bash

#This is the path to your wallaper
ORIGINAL_WALLPAPER="/usr/share/backgrounds/Manhattan_Sunset_by_Giacomo_Ferroni.jpg"


#This is the actual script, modify the options you want
if ! cmus-remote -C >/dev/null 2>&1 ; then
    echo >&2 "cmus is not running"
    exit 1
fi
echo "its running"
info=$(cmus-remote -Q)

state=$(echo "$info" | sed -n 's/^status //p')
if [ "$state" = "stopped" ]||[ "$state" = "paused" ] ; then
    gsettings set org.gnome.desktop.background picture-uri file://$ORIGINAL_WALLPAPER
    echo >&2 "no song playing currently, aborting!"
    exit 1
fi

rm file.jpg

file=$(echo "$info" | sed -n 's/^file //p')
ffmpeg -i "$file" file.jpg

imgh=$(identify -format "%h" $ORIGINAL_WALLPAPER)
screenres=$(xrandr | grep '*' | awk {'print $1'})
screenres=$(echo $screenres | cut -c6-9)
echo $screenres
factor=$(awk "BEGIN {print $screenres/$imgh}")
echo $factor

convert -resize 700x700 file.jpg file.jpg
convert -gravity SouthEast  -geometry +80+200 $ORIGINAL_WALLPAPER file.jpg -composite result.jpg

gsettings set org.gnome.desktop.background picture-uri file://$PWD/result.jpg
