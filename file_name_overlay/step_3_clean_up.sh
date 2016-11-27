#!/bin/bash
#####################################################
# Author:  David Kirwan <davidkirwanirl@gmail.com>
# Github:  https://github.com/davidkirwan
# Licence: GPL 3.0
# Cleans up temp files
#####################################################

function clean_up {
  mv $1/video/$1.mp4 dropbox/
  rm $1/video/*.jpg
}


for j in $(ls); do
  if [ $j != $0 ]
  then
    if [ -d $j ]
    then
      mkdir dropbox
      clean_up $j
    fi
  fi
done
