#!/bin/bash
set -x
pictures=/home/judge/Pictures

opacity=0.65
shade=out.png
input=sexy-model-woman-boobs-nude-gorgeous-trimmed-pussy-african-pierced-nipples-1366x768.png 
dimensions=$(identify "$input" |sed  's/.* \([0-9x]*\) .*/\1/g')
result=result.png

dimmer()
{
  rm -f $shade $result

  # create a black image with opacity
  convert -size "$dimensions" xc:'rgba(0, 0, 0, '$opacity')' $shade

  # overlay the transparent image onto the wallpaper image
  #convert $input -gravity center $shade -composite $result
  composite $shade $pictures/$input $result

  #rm -f $shade

  pkill swaybg
  swaybg -m fit -i $pictures/$result 2>/dev/null &
}

if [ "$#" -eq 2 ]
then
    opacity="$1"
    input="$2"
    dimensions=$(identify "$input" |sed  's/.* \([0-9x]*\) .*/\1/g')
    dimmer
else
    dimmer
fi
