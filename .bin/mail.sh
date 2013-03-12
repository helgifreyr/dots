#!/bin/sh
 
gmail_login="helgi.runarsson"
gmail_password="i1se5b28g"
 
dane="$(wget --secure-protocol=TLSv1 --timeout=3 -t 1 -q -O - \
https://${gmail_login}:${gmail_password}@mail.google.com/mail/feed/atom \
--no-check-certificate | grep 'fullcount' \
| sed -e 's/.*<fullcount>//;s/<\/fullcount>.*//' 2>/dev/null)"
 
if [ -z "$dane" ]; then
  echo "<fc=#25143e>G:</fc>"
else
  if [ $dane == 0 ]; then
    echo "<fc=#25143e>G: $dane</fc>"
  else
    echo "<fc=#25143e>G:</fc> <fc=#5f349d>$dane</fc>"
  fi
fi
