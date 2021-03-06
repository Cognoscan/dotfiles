# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Needed for some build scripts
export SHELL=bash

# Run unique startup script
if [ -f ~/.bash_unique ]; then
  source ~/.bash_unique
fi

# Add local programs to PATH if directory exists
if [ -d ~/bin ]; then
  PATH=~/bin:$PATH
  export PATH
fi

# Add hidden local programs to PATH if directory exists
if [ -d ~/.local/bin ]; then
  PATH=~/.local/bin:$PATH
  export PATH
fi

# Add Cargo (from Rust) to PATH if directory exists
if [ -d ~/.cargo/bin ]; then
  PATH=~/.cargo/bin:$PATH
  export PATH
fi

# Add local man pages to MANPATH is directory exists
if [ -d ~/share/man ]; then
  MANPATH=~/share/man:$MANPATH
  export MANPATH
fi

# Force to xterm-256color
if [ "$TERM" == "xterm" ]; then
  #export TERM=xterm-256color
  export TERM=screen
fi

# Load SSH Agent keys
if [[ ! "$SSH_AUTH_SOCK" ]]; then
  SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket
  export SSH_AUTH_SOCK
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

color_prompt=no

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    *color*)
      color_prompt=16;;
esac

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    *256color*)
      color_prompt=256;;
esac


# uncomment for a colored prompt, if the terminal has the capability
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=256
    else
	color_prompt=
    fi
fi

# Old Prompt, for reference to 256 color setting
# PS1='${debian_chroot:+($debian_chroot)}\[\e[01;38;5;208m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '

if [ "$COMPTYPE" == "windows" ]; then
   PS1='${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
elif [ "$color_prompt" = 256 ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\e[01;44;37m\]\u@\h \[\e[00;34m'"`tput setab 0`"''"`tput sc`"'\] \['"`tput rc`"'\]\[\e[01;40;37m\]\w \[\e[00;30m'"`tput sc`"'\] \['"`tput rc`"'\e[0m\] '
elif [ "$color_prompt" = 16 ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || test -r /etc/DIR_COLORS && eval "$(dircolors -b /etc/DIR_COLORS)" || eval "$(dircolors)"
    alias ls='ls -X --color=auto --group-directories-first'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -XalhF --color=auto --group-directories-first'
alias la='ls -XA --color=auto --group-directories-first'
alias l='ls -XCF --color=auto --group-directories-first'
alias mv='mv -i'
alias cp='cp -i'

#use ctl keys to move forward and back in words
bind '"\eOC":forward-word'
bind '"\eOD":backward-word'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

export EDITOR="vim"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ "$COMPTYPE" != "windows" ]; then
  if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
      . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
      . /etc/bash_completion
    fi
  fi
fi

#source /usr/lib/python3.4/site-packages/powerline/bindings/bash/powerline.sh

export ALTERAOCLSDKROOT="/home/scott/intelFPGA/16.1/hld"

export QSYS_ROOTDIR="/home/scott/build/quartus-lite/pkg/quartus-lite//opt/altera/quartus/sopc_builder/bin"
