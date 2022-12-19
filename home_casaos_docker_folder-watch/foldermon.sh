#!/bin/bash

topdir="$1"
targdir="$2"

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
    FILES=($(ls "$topdir/"))
    for AFILE in "${FILES[@]}"
      do
      if [[ "$AFILE" == "@eaDir" ]]; then
       rm -r "$topdir/$AFILE"
      else
      
      if [ -d "$topdir/$AFILE" ]; then
        SUBFILES=($(ls "$topdir/$AFILE"))
          for EAFILE in "${SUBFILES[@]}"
            do
            if [[ "$EAFILE" == "@eaDir" ]]; then
              rm -r "$topdir/$AFILE/$EAFILE"
            fi
            done
       fi
       mv "$topdir/$AFILE" "$targdir/"
      fi
      done
IFS=$SAVEIFS
