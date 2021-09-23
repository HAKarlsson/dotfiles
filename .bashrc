# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
[[ $DISPLAY ]] && shopt -s checkwinsize

# History {{{
shopt -s histappend
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=1000
HISTFILESIZE=2000
# }}}
# Prompt {{{
export PS1="\[\e[1;32m\][\w] \[\e[0m\]"
# }}}
# Default editor {{{
export EDITOR=nvim
# }}}
# Aliases {{{
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -Al'
alias la='ls -A'
alias tmux='tmux -f ~/.config/tmux/config'
# }}}

# RISC-V {{{
export RISCV=/opt/riscv
export HOL=/home/hak/Sources/HOL
export PATH=$HOL/bin:$RISCV/bin:$PATH
# }}}

export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
gpgconf --launch gpg-agent

source /etc/bash_completion
