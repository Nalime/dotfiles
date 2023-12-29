#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#######################
# Configuration files #
#######################

# Machine-specific settings
# In .gitignore
specific_path=~/.bash_specific
[[ -f "$specific_path" ]] && . "$specific_path"

# Define color escapes
. ~/.bash_colors

#########################
# Bash history settings #
#########################

# History size
export HISTSIZE=999999
export HISTFILESIZE=999999

# History timestamps
export HISTTIMEFORMAT='%F %T '

# Append instead of overwriting to history file
shopt -s histappend

# Record to history file after each execution of command
export PROMPT_COMMAND="history -a;$PROMPT_COMMAND"

# Do not record commands with leading spaces
export HISTCONTROL=$HISTCONTROL:ignorespace

####################
# General settings #
####################

# Editors

export EDITOR=vim
export VISUAL=nvim

# Fancy prompt
# Additionally, on nonzero return, the value is shown and the face changes

prompt_face() {
    exit_status=$?

    res=''
    res+="${esc_format["bold"]}"
    if [[ $exit_status = 0 ]] ; then
        res+="${esc_color["l_yellow"]}owo"
    else
        res+="${esc_color["l_red"]}>_<${esc_format["reset"]}"
        res+="${esc_color["d_red"]} ($exit_status)"
    fi
    res+="${esc_format["reset"]}"

    printf "$res"
}

PS1="\
${esc_format["bold"]}${esc_color["l_green"]}\u${esc_format["reset"]}\
:\$(prompt_face):\
${esc_format["bold"]}${esc_color["l_blue"]}\W${esc_format["reset"]}\
\\$ \
"

# Colorize command outputs
[[ $(uname -s) == "FreeBSD" ]] || alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Colorize and format less
# https://wiki.archlinux.org/index.php/Color_output_in_console#man

# bold/blink
export LESS_TERMCAP_md=${format["bold"]}${color["l_blue"]}
export LESS_TERMCAP_me=${format["reset"]}

# underline
export LESS_TERMCAP_us=${format["italic"]}${format["underline"]}${color["l_gray"]}
export LESS_TERMCAP_ue=${format["reset"]}

# Add personal binaries to path
PATH="$PATH":~/.local/bin

# Kyopro tools
oj_path=~/A/kyopro/tools/oj-utils
[[ -f "$oj_path" ]] && . "$oj_path"

#############################
# Machine-specific settings #
#############################

# Uncomment below in the .bash_specific file

# In case the environment doesn't recognize xterm-kitty QwQ
# export TERM=xterm-256color

# xclip aliases
# Note that MacOS has pbcopy and pbpaste
# alias xcopy='xclip -sel clip -i'
# alias xpaste='xclip -sel clip -o'

# Gigantic stack size; pretty much necessary for kyopro
# Best to set according to actual memory limits
# ulimit -Ss $((2 * 1024 * 1024))
