# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

color_prompt=yes
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi



#defined by xie chen
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ....='cd ../../../..'
alias duh='du -h --max-depth=1'
# alias sdrg01='ssh REDMOND.xieche@sdrg01'
# alias sdrg02='ssh REDMOND.xieche@sdrg02'
alias sdrg01='ssh REDMOND.xieche@sdrg01'
alias sdrg02="sshpass -p 'ch@ng3m3now' ssh yushi@10.57.215.254"
alias lmmachine="sshpass -p 'FANGHUA$915' ssh xieche@speech01.svceng.com"
alias dgx01='ssh xieche@10.184.185.91'
alias dgx02='ssh xieche@10.184.185.92'
function scpfromsdrg01
{
	scp REDMOND.xieche@sdrg01:~/$@ ./
}
function scptosdrg01
{
	scp $@ REDMOND.xieche@sdrg01:~/
}
function scpdirtosdrg01
{
	scp -r $@ REDMOND.xieche@sdrg01:~/
}
function scptosdrg02
{
	scp $@ REDMOND.xieche@sdrg02:~/
}
function scpdirtosdrg02
{
	scp -r $@ REDMOND.xieche@sdrg02:~/
}

function scp2sdrgvc
{
	philly-fs -cp $@  //philly/rr1/sdrgvc/xieche/pytorchLM/
}
function scpdir2sdrgvc
{
	philly-fs -cp -r $@  //philly/rr1/sdrgvc/xieche/pytorchLM/
}
function scp2ipgsp
{
	philly-fs -cp $@ //philly/sc1/ipgsp/xieche/pytorchLM/
}
function scpdir2ipgsp
{
	philly-fs -cp -r $@ //philly/sc1/ipgsp/xieche/pytorchLM/
}

export AZURE_STORAGE_ACCESS_KEY=wCDPJRYsvHqYu/deVux2Oih5z2/8c+e9/X71goSQ7brpootQjAg2OsWWTcdMJvcN8zgktGm4A/yp22TEP4ZyBA==
function cp2ipgsp
{
	fn=`basename $1`
	azcopy --source $1 --destination https://exawattaisc.blob.core.windows.net/philly-sdrgvc/xieche/${fn} --dest-key wCDPJRYsvHqYu/deVux2Oih5z2/8c+e9/X71goSQ7brpootQjAg2OsWWTcdMJvcN8zgktGm4A/yp22TEP4ZyBA==
	philly-fs -cp https://exawattaisc.blob.core.windows.net/philly-sdrgvc/xieche/${fn} gfs://sc1/ipgsp/xieche/${fn}
}
function cpdir2ipgsp
{
	fn=`basename $1`
	azcopy --source $1 --destination https://exawattaisc.blob.core.windows.net/philly-sdrgvc/xieche/${fn} --dest-key wCDPJRYsvHqYu/deVux2Oih5z2/8c+e9/X71goSQ7brpootQjAg2OsWWTcdMJvcN8zgktGm4A/yp22TEP4ZyBA== --recursive
	philly-fs -cp -r https://exawattaisc.blob.core.windows.net/philly-sdrgvc/xieche/${fn} gfs://sc1/ipgsp/xieche/${fn}
}

function cp2msrmt
{
	fn=`basename $1`
	azcopy --source $1 --destination https://exawattaisc.blob.core.windows.net/philly-sdrgvc/xieche/${fn} --dest-key wCDPJRYsvHqYu/deVux2Oih5z2/8c+e9/X71goSQ7brpootQjAg2OsWWTcdMJvcN8zgktGm4A/yp22TEP4ZyBA==
	philly-fs -cp https://exawattaisc.blob.core.windows.net/philly-sdrgvc/xieche/${fn} gfs://wu3/msrmt/xieche/${fn}
}
function cpdir2msrmt
{
	fn=`basename $1`
	azcopy --source $1 --destination https://exawattaisc.blob.core.windows.net/philly-sdrgvc/xieche/${fn} --dest-key wCDPJRYsvHqYu/deVux2Oih5z2/8c+e9/X71goSQ7brpootQjAg2OsWWTcdMJvcN8zgktGm4A/yp22TEP4ZyBA== --recursive
	philly-fs -cp -r https://exawattaisc.blob.core.windows.net/philly-sdrgvc/xieche/${fn} gfs://wu3/msrmt/xieche/${fn}
}


export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib"

# added by Anaconda2 installer
# export PATH="/home/chenxie95/anaconda2/bin:$PATH"  # commented out by conda initialize
export PATH="/home/chenxie95/kenlm/kenlm/build/bin:/home/chenxie95/srilm/bin/i686-m64:$PATH"

export PHILLY_USER=xieche
alias rsubssh='ssh -R 52698:localhost:52698 REDMOND.xieche@sdrg01'
alias philly-fs='bash ~/philly-fs.bash'
alias py37='source activate py37'

alias zetadir='cd /mnt/e/debug/exercise/exercise_aml/ComputeInfra/ZettA-AML/AzureMachineLearning'

