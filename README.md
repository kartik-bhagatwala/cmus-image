# cmus-image
A small bash script to display album art from cmus, for GNOME

It extracts the image from a music file, then uses imagemagick to overlay the image on your wallpaper. I wasnt satisfied with any of the other album art displayers, and other solutions were annoying since they would interrupt focus when the song changed. With this script, the image is always in the background, and doesnt affect window focus.  

# Installation

dependencies (ubuntu):`sudo apt install ffmpeg imagemagick-6.q16 cmus`

place the script anywhere in your path, usually in `~/.local/bin`

in cmus, enter `:set status_display_program=cdisp.sh`

# Usage

You will need to set your current wallpaper in the script. 

Edit the script, wherever you put it, and change line 4 to specify the path where your wallpaper image is located. ex: `ORIGINAL_WALLPAPER=/usr/share/backgrounds/warty-final-ubuntu.png`

