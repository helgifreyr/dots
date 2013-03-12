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
#    album = []; artist = []; title = []
#    j=0
#    for thing in artistinfo:
#        if j == 0:
#            album.append(thing)
#        if j == 1:
#            artist.append(thing)
#        if j == 2:
#            title.append(thing)
#        if j == 3:
#            track = thing
#        if thing == '/':
#            j+=1

    status = '<fc=orange>'+info[1].split()[0]+'</fc>'
    position = '<fc=red>'+info[1].split()[2]+'</fc>'
    album = '<fc=blue>'+album+'</fc>'
    artist = '<fc=#25143e>'+artist+'</fc>'
    if info[1].split()[0] == '[playing]':
      title = '<fc=#5f349d>'+title+'</fc>'
    else:
      title = '<fc=#25143e>'+title+'</fc>'

#    prenta = status+'<fc=white>:</fc> '+artist +'<fc=white>/</fc> '+ album +'<fc=blue>-'+ track +'</fc> <fc=white>/</fc>'+ title +'<fc=white>~</fc> '+ position
    prenta = title+'<fc=#71637D> by </fc>'+artist
    print prenta
else:
    print '<fc=#25143e>no music</fc>'
