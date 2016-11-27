#!/bin/bash
#####################################################
# Author:  David Kirwan <davidkirwanirl@gmail.com>
# Github:  https://github.com/davidkirwan
# Licence: GPL 3.0
# Generate video from files
#####################################################

function render_video {

  ffmpeg -framerate 3 -i $1/video/new-%04d.jpg.jpg \
         -s 640x480 -c:v libx264 -r 30 \
         -vf "fps=25,format=yuv420p" \
         $1/video/$1.mp4
}


for j in $(ls); do
  if [ $j != $0 ]
  then
    if [ -d $j ]
    then
      render_video $j
    fi
  fi
done
