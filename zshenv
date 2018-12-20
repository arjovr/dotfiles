
typeset -U path

export PLAN9=/usr/local/plan9

path=($HOME/bin $path $PLAN9/bin)

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LD_LIBRARY_PATH=$HOME/lib
export EDITOR=vim
export GOPATH=$HOME

