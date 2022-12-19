#!/bin/bash

topdir=$1
echo "$1" > "/DATA/AppData/Folder Monitor/watch_folder_test.txt"
foldername=$(dirname "$topdir")
targdir="/mnt/Storage1-1/Media/$foldername"

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
    FILES=($(sudo ls "$topdir/"))
    for AFILE in "${FILES[@]}"
      do
      if [[ "$AFILE" == "@eaDir" ]]; then
       rm "$topdir/$AFILE"
      else
       sudo mv "$topdir/$AFILE" "$targdir/"
      fi
      done
IFS=$SAVEIFS
