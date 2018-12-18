# disable ctrl-s and ctrl-q
stty -ixon
ttyctl -f

setopt HIST_IGNORE_DUPS
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz compinit vcs_info edit-command-line zkbd
compinit

zstyle ':completion:*' rehash true
zstyle ':vcs_info:git*' formats "(%s) [%b]"
zstyle ':vcs_info:git*' actionformats "(%s) [%b|%a]"

precmd() {
	vcs_info
	print -Pn "\e]2;%n@%m %~ ${vcs_info_msg_0_} \a"
	PS1="%n@%m:%~ ${vcs_info_msg_0_}"$'\n'"%f:; "
}

# Keyboard
bindkey -e
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# home, end key
bindkey "\033[H" beginning-of-line
bindkey "\033[F" end-of-line


# aliases
# programs configuration
alias registration_conf="ssh  -t lilith '/home/sjf/bin/registration_conf tflz'"
eval $(dircolors)
alias ls='ls --color=auto'
alias lh='ls -lh'
alias grep='grep --color=auto'
LESS='--ignore-case --raw-control-chars'
PAGER='less'
