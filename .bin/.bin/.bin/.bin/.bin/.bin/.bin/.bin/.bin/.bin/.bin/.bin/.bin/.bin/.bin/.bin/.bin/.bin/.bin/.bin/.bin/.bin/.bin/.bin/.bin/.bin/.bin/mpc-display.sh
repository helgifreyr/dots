#!/bin/bash

first=$( mpc -f '%artist% / %album% / %track% / %title%' | cat | head -1  )
position=$( mpc | cat | head -2 | tail -1 | cut -d " " -f 3- )

echo "$first ~ $position"
