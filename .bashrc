#================================================================================
# PATH settings
#================================================================================

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

[[ -s /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -s ~/.cargo/env ]] && source ~/.cargo/env

export PATH=~/.local/bin:$PATH

# export LESS=''
export LESS='--mouse'
# export LESS='--mouse --mouse-lines=3'

export EDITOR=vim

export TERM=tmux-256color
# export TERM=xterm-256color

#================================================================================
# set and shopt
#================================================================================

# https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
# https://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html
set -o emacs
shopt -s cmdhist
shopt -s direxpand
shopt -s dirspell
shopt -s globstar
shopt -s histappend
shopt -s nocaseglob
shopt -s nocasematch
shopt -s nullglob

#================================================================================
# keybinds
#================================================================================

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

#================================================================================
# aliases
#================================================================================

alias l='ls -ohF --color=auto' # --group-directories-first
alias ll='ls -AohF --color=auto' # --group-directories-first

alias tree='tree -C --dirsfirst --noreport'

alias grep='grep -I'

alias to-lower="tr '[:upper:]' '[:lower:]'"
alias to-upper="tr '[:lower:]' '[:upper:]'"
alias words='cat /usr/share/dict/words'

#================================================================================
# prompt
#================================================================================

# Color         | FG Code | BG Code || Code | Description
#============== ==========================================
# Black         |      30 |      40 ||    0 | Reset/Normal
# Red           |      31 |      41 ||    1 | Bold text
# Green         |      32 |      42 ||    2 | Faint text
# Yellow        |      33 |      43 ||    3 | Italics
# Blue          |      34 |      44 ||    4 | Underlined text
# Magenta       |      35 |      45
# Cyan          |      36 |      46
# Light Gray    |      37 |      47
# Gray          |      90 |     100
# Light Red     |      91 |     101
# Light Green   |      92 |     102
# Light Yellow  |      93 |     103
# Light Blue    |      94 |     104
# Light Magenta |      95 |     105
# Light Cyan    |      96 |     106
# White         |      97 |     107
#
# usage: \e[{code}m

function .dots.prompt-command {
    local exit_code=$?

    local P1_CODE='\[\e[32m\]'
    local P2_CODE='\[\e[34m\]'
    local P3_CODE='\[\e[33m\]'
    local P4_CODE='\[\e[36m\]'
    local R_CODE='\[\e[0m\]'

    case $exit_code in
        0) P1_CODE='\[\e[32m\]' ;;
        *) P1_CODE='\[\e[31m\]' ;;
    esac

    PS1="${P1_CODE}${exit_code}${R_CODE} "

    if [[ -n "$SSH_CLIENT" ]]
    then
        PS1+="${P4_CODE}\u@\h${R_CODE} "
    fi

    PS1+="${P2_CODE}\w${R_CODE} "
    PS1+="${P3_CODE}λ${R_CODE} "

    return $exit_code
}

export PROMPT_DIRTRIM=3
export PROMPT_COMMAND=.dots.prompt-command


