#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#######################
# Configuration files #
#######################

# Machine-specific settings (in .gitignore)
specific_path=~/.bash_specific
# shellcheck source=.bash_specific
[[ -f "$specific_path" ]] && . "$specific_path"

# Define color escapes
# shellcheck source=.bash_colors
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

# Disable output pausing via Ctrl+S (and enable forward incremental search)
stty -ixon

# Editors

export EDITOR=vim
export VISUAL=nvim

# Fancy prompt
# Additionally, on nonzero return, the value is shown and the face changes

get_ps1() {
    local exit_status=$?

    get_name() {
        local middle=""
        if [[ $(whoami) == "root" ]]; then
            middle="${esc_color["l_red"]}"
        else
            middle="${esc_color["l_green"]}"
        fi
        echo -n "${esc_format["bold"]}${middle}\u${esc_format["reset"]}"
    }

    get_host() {
        local middle=""
        if [[ $(whoami) == "root" ]]; then
            middle="${esc_color["d_red"]}"
        else
            middle="${esc_color["d_green"]}"
        fi
        echo -n "${esc_format["bold"]}${middle}\h${esc_format["reset"]}"
    }

    get_face() {
        local exit_status=$1

        local middle=""
        if [[ $exit_status = 0 ]]; then
            if [[ $(whoami) == "root" ]]; then
                middle="${esc_color["l_yellow"]}O_O"
            else
                middle="${esc_color["l_yellow"]}owo"
            fi
        else
            middle="${esc_color["l_red"]}>_<${esc_format["reset"]}"
            middle+="${esc_color["d_red"]} ($exit_status)"
        fi
        echo -n "${esc_format["bold"]}${middle}${esc_format["reset"]}"
    }

    get_path() {
        local middle="${esc_color["l_blue"]}\w"
        echo -n "${esc_format["bold"]}${middle}${esc_format["reset"]}"
    }

    get_symbol() {
        local middle="\$"
        echo -n "${esc_format["bold"]}${middle}${esc_format["reset"]}"
    }

    local ans=""
    ans+="$(get_name)@$(get_host):$(get_face $exit_status):"
    ans+="$(get_path)\n$(get_symbol) "

    unset get_name
    unset get_host
    unset get_face
    unset get_path
    unset get_symbol

    echo -n "$ans"
}

PROMPT_COMMAND='PS1=$(get_ps1)'

# Colorize command outputs
[[ $(uname -s) == "FreeBSD" ]] || alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Colorize and format less
# https://wiki.archlinux.org/index.php/Color_output_in_console#man

if [[ "$(uname)" == 'Linux'
    && "$(grep '^ID=' /etc/os-release)" == 'ID=arch' ]]; then
    export MANROFFOPT="-P -c"
fi

# bold/blink
export LESS_TERMCAP_md=${format["bold"]}${color["l_blue"]}
export LESS_TERMCAP_me=${format["reset"]}

# underline
export LESS_TERMCAP_us=${format["italic"]}${format["underline"]}${color["l_gray"]}
export LESS_TERMCAP_ue=${format["reset"]}

# Add personal binaries to path
PATH="$PATH":~/.local/bin

# Kyopro tools
kpr_path=~/A/kyopro/tools/main
# shellcheck source=A/kyopro/tools/main
[[ -f "$kpr_path" ]] && . "$kpr_path"

# lfcd
# https://github.com/gokcehan/lf/wiki/Tips#cd-to-current-directory-on-quit
lf() {
    export LF_CD_FILE=/var/tmp/.lfcd-$$
    command lf "$@"
    if [[ -s "$LF_CD_FILE" ]]; then
        local DIR="$(realpath "$(cat "$LF_CD_FILE")")"
        if [[ "$DIR" != "$PWD" ]]; then
            echo "cd to $DIR"
            cd "$DIR"
        fi
        rm "$LF_CD_FILE"
    fi
    unset LF_CD_FILE
}

# fzf

# Preview mode
fzfp() {
    # shellcheck disable=SC2016
    local previewer=(
        'bat'
        '--style=numbers'
        '--color=always'
        '--terminal-width="$FZF_PREVIEW_COLUMNS" {}'
    )
    fzf --preview="${previewer[*]}"
}

# Set up key bindings and fuzzy completion
eval "$(fzf --bash)"

# end fzf

# zoxide
eval "$(zoxide init bash)"

# eza
eza() {
    command eza \
        --git \
        --time-style='+%Y-%m-%d %H:%M:%S' \
        "$@"
}
alias e=eza

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

# Start keychain (change xxx)
# eval "$(keychain --eval --agents ssh id_xxx)"
