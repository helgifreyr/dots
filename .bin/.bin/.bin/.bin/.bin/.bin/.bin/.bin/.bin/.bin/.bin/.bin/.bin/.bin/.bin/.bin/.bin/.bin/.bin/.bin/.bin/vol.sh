#!/bin/sh

vol=$(amixer get Master | awk -F'[]%[]' '/%/ {if ($7 == "off") { print "MM" } else { print $2/10 }}' | head -n 1)

if [ $vol == 0 ]; then
  echo "<fc=#25143e>Vol: $vol</fc>"
else
  echo "<fc=#25143e>Vol:</fc> <fc=#5f349d>$vol</fc>"
fi

exit 0
