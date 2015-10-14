from subprocess import check_output

user = 'helgi.runarsson'
kodi = '8piG/c^4g'

info = check_output(['curl','-su',user+':'+kodi,'https://mail.google.com/mail/feed/atom'])
print info

number = info.split('fullcount')[1][1:-2]

if int(number) == 0:
    print '<fc=#25143e>G: '+number+'</fc>'
elif int(number) != 0:
    print '<fc=#25143e>G:</fc> <fc=#5f349d>'+number+'</fc>'
else:
    print '<fc=#25143e>G:</fc>'
