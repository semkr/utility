#!/bin/bash
#####################################################
# Author:  David Kirwan <davidkirwanirl@gmail.com>
# Github:  https://github.com/davidkirwan
# Licence: GPL 3.0
# Preprocess image files in sub directories, overlay
# filename onto image
#####################################################

function pre_process {
  a=1
  for i in $(ls $1/*.JPG); do
    if [ -f $i ]
    then
      convert $i \
              -pointsize 72 -fill white -annotate +100+100  \
              %[exif:DateTimeOriginal] $1/video/"new-$(printf "%04d.jpg" "$a").jpg"
    fi
    let a=a+1
  done
}


for j in $(ls); do
  if [ $j != $0 -a $j != 'dropbox' ]
  then
    #
    if [ -d $j ]
    then
      mkdir $j/video
      pre_process $j
    fi
  fi
done

