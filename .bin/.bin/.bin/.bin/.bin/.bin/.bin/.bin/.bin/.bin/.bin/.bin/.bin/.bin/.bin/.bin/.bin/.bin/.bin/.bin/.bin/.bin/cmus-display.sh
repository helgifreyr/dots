#!/bin/bash

if [ ! -x /usr/bin/cmus-remote ];
then
  echo "cmus is not installed."
  exit
fi

ARTIST=$( cmus-remote -Q 2>/dev/null | grep "tag artist " | cut -d " " -f 3- )
TITLE=$( cmus-remote -Q 2>/dev/null | grep "tag title" | cut -d " " -f 3- )
POSITION=$( cmus-remote -Q 2>/dev/null | grep "position" | cut -d " " -f 2- )
posmin=$((POSITION / 60))
possec=`printf "%02d" $i$((POSITION % 60))`
DURATION=$( cmus-remote -Q 2>/dev/null | grep "duration" | cut -d " " -f 2- )
durmin=$((DURATION / 60))
dursec=`printf "%02d" $i$((DURATION % 60))`
trackno=$( cmus-remote -Q 2>/dev/null | grep "tracknumber" | cut -d " " -f 3- )

if [ -z "$ARTIST" ];
then
    ARTIST=$( cmus-remote -Q 2>/dev/null | grep "tag albumartist" | cut -d " " -f 3- )
fi

if [ -z "$ARTIST" ];
then
  echo "Nothing"
else
  echo "$ARTIST - $trackno - $TITLE ~ $posmin:$possec/$durmin:$dursec"
fi
