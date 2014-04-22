#!/bin/sh
 
gmail_login="helgi.runarsson"
gmail_password=$1
 
dane=`curl -su ${gmail_login}:${gmail_password} https://mail.google.com/mail/feed/atom | grep 'fullcount' | sed -r 's|.*>(.*)</.*|\1|'`

if [ -z "$dane" ]; then
  echo "<fc=#25143e>G:</fc>"
else
  if [ $dane == 0 ]; then
    echo "<fc=#25143e>G: $dane</fc>"
  else
    echo "<fc=#25143e>G:</fc> <fc=#5f349d>$dane</fc>"
  fi
fi
