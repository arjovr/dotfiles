typeset -U path

GOPATH=$HOME
PLAN9=/usr/local/plan9
LC_ALL=en_US.UTF-8
LANG=en_US.UTF-8
LANGUAGE=en_US.UTF-8
LD_LIBRARY_PATH=$HOME/lib
BROWSER=webBrowser
EDITOR=vim

HISTFILE=$HOME/.zsh_history
SAVEHIST=10000
HISTSIZE=10000

path=(/home/sjf/bin $path $PLAN9/bin)

eval $(dircolors dircolors.ansi-light)
alias ls='ls --color'

# Enable color in grep
alias grep='grep --color=auto'
GREP_COLOR='3;33'

LESS='--ignore-case --raw-control-chars'
PAGER='less'

export PATH HISTFILE GOPATH PLAN9 LANG LC_ALL LANGUAGE LD_LIBRARY_PATH BROWSER EDITOR
export CLICOLOR LS_COLORS GREP_COLOR GREP_OPTIONS LESS PAGER 

