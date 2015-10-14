if [[ -z "$DISPLAY" ]] && [[ $(tty) = /dev/tty1 ]]; then
    startx &
#    xflux -l 59.283 -g 18.05
    logout
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/h/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
bindkey -v
# End of lines configured by zsh-newuser-install
#

setopt completealiases

[ -r /usr/share/doc/pkgfile/command-not-found.zsh ] && . /usr/share/doc/pkgfile/command-not-found.zsh

PS1='[\u@\h \W]\$ '
eval $(dircolors ~/.dircolors)

autoload -U colors && colors
PROMPT="%{$fg_bold[magenta]%}%1~/ %{$reset_color%}"
RPROMPT="%{$fg_no_bold[blue]%}[%{$reset_color%}%{$fg_bold[magenta]%}%n%{$reset_color%}%{$fg_no_bold[blue]%}@%{$reset_color%}%{$fg_no_bold[magenta]%}%M%{$reset_color%}%{$fg_no_bold[blue]%}]%{$reset_color%}"

zle-keymap-select() {
  local showcmd="<C>"

  if [[ $KEYMAP = vicmd ]]; then
    PROMPT="%{$fg_no_bold[magenta]%}%1~/ %{$reset_color%}"
    zle reset-prompt
  else
    PROMPT="%{$fg_bold[magenta]%}%1~/ %{$reset_color%}"
    zle reset-prompt
  fi
}
zle -N zle-keymap-select

if [[ $TERM == xterm-256color ]]; then
    . /etc/profile.d/vte.sh
    __vte_osc7
fi


# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}

key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' ${terminfo[smkx]}
    }
    function zle-line-finish () {
        printf '%s' ${terminfo[rmkx]}
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi

alias ls='ls -h --color=auto'
alias ll='ls++ --potsf'
alias la='ls -A'
alias l='ls -CF'
alias lr='ls | sort -R | head'

alias mv='mv -iv'
alias rm='rm -Iv'
alias cp='cp -iv'

alias du='cdu -idh'
alias df='dfc -s'

alias cl='clear'

alias ccat='pygmentize -g'

alias maple='/home/h/.maple14/bin/maple'
# alias mathematica='/home/h/.mathematica/Executables/mathematica'

alias python=/usr/bin/python2
alias f2py=/usr/bin/f2py2

alias ff++=/usr/bin/FreeFem++

# alias vless='vim -u  /usr/share/vim/vim74/macros/less.vim'
alias eduroam='sudo pkill wpa_supplicant && sudo wpa_supplicant -Dwext -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf && sudo dhcpd wlp3s0 &'

if [[ -n "$DISPLAY" ]]; then
    feh --bg-max ~/pictures/wallpaper/wBKmC1u.jpg
    xrdb ~/.Xdefaults
    xmodmap .xmodmap
fi

export EDITOR="vim"
export BROWSER="firefox"
# export TERM="xterm-256color"
#
export LESS='-R'
export LESSOPEN='|~/.lessfilter %s'

export HOME_LORENE=/home/h/Lorene
export HOME_KADATH=/home/h/Kadath
export HDF5INCLUDEDIR="/usr/include"
export HDF5LIBDIR="/usr/lib"
export PATH=$PATH:/home/h/.lib/python 
export PYTHONPATH="$PYTHONPATH:/home/h/.lib/python"
