#!/bin/sh

#list battery, sub all non-numbers for nothing, split the string at whitespaces and grep the one with %

battery=$( acpi -b | tr " " "\n" | grep % | awk '{ gsub(/,/,"")}1' )

echo B: $battery

exit 0
