#!/usr/bin/python

from subprocess import check_output

info = check_output(['mpc','-f','%album% / %artist% / %title% / %track%'])
info = info.split('\n')

if len(info)>2:
#    info = info.split('\n')
    artistinfo = info[0]
    album = info[0].split('/')[0]
    artist = info[0].split('/')[1][1:-1]
    title = info[0].split('/')[2][1:-1]
    track = info[0].split('/')[3]

    status = '<fc=orange>'+info[1].split()[0]+'</fc>'
    position = '<fc=red>'+info[1].split()[2]+'</fc>'
    album = '<fc=blue>'+album+'</fc>'
    artist = '<fc=#25143e>'+artist+'</fc>'
    if info[1].split()[0] == '[playing]':
      title = '<fc=#5f349d>'+title+'</fc>'
      position = '<fc=#5f349d>'+info[1].split()[2]+'</fc>'#<fc=#71637d>:</fc> '
    else:
      title = '<fc=#25143e>'+title+'</fc>'
      position = '<fc=#25143e>'+info[1].split()[2]+'</fc>'#<fc=#71637d>:</fc> '

    prenta = title+'<fc=#71637D> by </fc>'+artist+' '+position
    print prenta
else:
    print '<fc=#25143e>no music</fc>'
