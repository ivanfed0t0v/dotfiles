#!/bin/bash

TEMPDIR=/tmp
# Path to the lock image
IMGDIR=~/img

# Create screenshots for each monitor separately
xdpyinfo -ext XINERAMA | sed '/^  head #/!d;s///' |
while IFS=' :x@,' read i w h x y; do
    import -window root -crop ${w}x$h+$x+$y $TEMPDIR/head_$i.png
done

# Get number of monitors
let n=$(xrandr --listactivemonitors | awk 'FNR == 1 { print $2 }')-1

# For every screenshot
for i in `seq 0 $n`;
do
    # Pixellate
    convert $TEMPDIR/head_$i.png -scale 10% -scale 1000% -colorspace Gray $TEMPDIR/head_$i.png

    # Add lock icon
    [[ -f $IMGDIR/lock.png ]] && convert $TEMPDIR/head_$i.png $IMGDIR/lock.png -gravity center -composite -matte $TEMPDIR/head_$i.png
done

# Join all images together
convert $TEMPDIR/head_*.png +append $TEMPDIR/screen.png

# Clean up a little bit
rm $TEMPDIR/head_*.png

# Call i3lock
i3lock -u -i $TEMPDIR/screen.png
