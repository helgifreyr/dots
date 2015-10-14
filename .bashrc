#if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
#    startx &
#    xflux -l 59.283 -g 18.05
#    logout
#fi
# If not running interactively, don't do anything
# sfkajsfas
[ -z "$PS1" ] && return

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls -h --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ls='ls -h --color=auto'
alias ll='ls++ --potsf'
alias la='ls -A'
alias l='ls -CF'
alias lr='ls | sort -R | head'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

export PYTHONPATH=$PYTHONPATH:/home/helgi/.python/
export EDITOR="vim"

# Sets the Mail Environment Variable
MAIL=/var/spool/mail/helgi && export MAIL

alias iraf='sh ~/iraf'
alias mv='mv -iv'
alias rm='rm -Iv'
alias cp='cp -iv'
alias skoli='cd /home/helgi/skoli/su'
alias cdwine='cd .wine/drive_c/'
alias log='sudo tail -f /var/log/messages.log'
alias getip='ifconfig wlan0 | grep -o "addr:[0-9.]*" | grep -o "[0-9.]*"'
alias suspend='sudo pm-suspend'
alias pyplot='ipython -pylab -p scipy'
alias mergepdf='gs -q -sPAPERSIZE=letter -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -sOutputFile=out.pdf'
#alias jmc='TERM=xterm; ssh helgi@johnmcclane.com'
alias jmcfs='sshfs helgi@johnmcclane:/home/share-read-write/ /home/h/jmc'
#alias svarthol='ssh hfr1@svarthol.raunvis.hi.is'
alias maple='/home/h/.maple14/bin/maple'
alias katla='ssh hfr1@katla.rhi.hi.is'
alias python=/usr/bin/python2
alias bb="sudo bleachbit --delete system.cache system.localizations system.trash system.tmp"
alias cc="sudo cacheclean 2"
alias gmail="/home/helgi/.bin/mail.sh"
alias vol="/home/helgi/.bin/vol.sh"
#alias math="rlwrap /home/helgi/Wolfram/Mathematica/8.0/Executables/math"
#alias mathematica="/home/helgi/Wolfram/Mathematica/8.0/Executables/mathematica"
alias steam='force_s3tc_enable=true steam'
alias senda='rsync -alhz --stats --progress /home/h/skoli/ kerr:/home/h/skoli/'
alias nai='rsync -alhz --stats --progress kerr:/home/h/skoli/ /home/h/skoli/'

#xmodmap -e "remove lock = Caps_Lock"
if [[ -n "$DISPLAY" ]]; then
    feh --bg-max pictures/wallpaper/starry-night.png
    xrdb .Xdefaults
fi
