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

alias maple='/home/h/.maple14/bin/maple'

alias python=/usr/bin/python2

alias senda='rsync -alhz --stats --progress /home/h/skoli/ kerr:/home/h/skoli/'
alias nai='rsync -alhz --stats --progress kerr:/home/h/skoli/ /home/h/skoli/'

if [[ -n "$DISPLAY" ]]; then
    feh --bg-max ~/pictures/wallpaper/starry-night.png
    xrdb ~/.Xdefaults
    xmodmap .xmodmap
fi

export EDITOR="vim"
