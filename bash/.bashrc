#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#######################
# Configuration files #
#######################

# Machine-specific settings before everything
# shellcheck source=.bash_specific_pre
if [[ -r ~/.bash_specific_pre ]]; then
    source ~/.bash_specific_pre
fi

# Define color escapes
# shellcheck source=.bash_colors
if [[ -r ~/.bash_colors ]]; then
    source ~/.bash_colors
fi

# Hook for command not found
if [[ -r /usr/share/doc/pkgfile/command-not-found.bash ]]; then
    source /usr/share/doc/pkgfile/command-not-found.bash
fi

# bash-completion
if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

####################
# General settings #
####################

# Disable output pausing via Ctrl+S (and enable forward incremental search)
stty -ixon

# Add personal binaries to PATH
PATH="$PATH":~/.local/bin

# Set editor variables
export EDITOR=vim
export VISUAL=nvim

# Set timestamp format
export TIME_STYLE='+%Y-%m-%d %H:%M:%S'

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

# Colorize command outputs via aliasing
[[ $(uname -s) == "FreeBSD" ]] || alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Colorize and format less
# https://wiki.archlinux.org/index.php/Color_output_in_console#man

if [[ "$(uname)" == 'Linux'
    && "$(grep '^ID=' /etc/os-release)" == 'ID=arch' ]]; then
    export MANROFFOPT="-P -c"
fi

## bold/blink
export LESS_TERMCAP_md=${format["bold"]}${color["l_blue"]}
export LESS_TERMCAP_me=${format["reset"]}

## underline
export LESS_TERMCAP_us=${format["italic"]}${format["underline"]}${color["l_gray"]}
export LESS_TERMCAP_ue=${format["reset"]}

#########################
# Bash history settings #
#########################

# History size
export HISTSIZE=999999
export HISTFILESIZE=999999

# History timestamps
export HISTTIMEFORMAT='%F %T '

# Append to instead of overwriting history file
shopt -s histappend

# Record to history file after each execution of command
# I don't use `history -n` because it seems to act weird
export PROMPT_COMMAND="$PROMPT_COMMAND; history -a; history -c; history -r"

# Do not record commands with leading spaces
export HISTCONTROL=$HISTCONTROL:ignorespace

# Do not record below commands
export HISTIGNORE="clear:reset:history"

#################
# Tool settings #
#################

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

# fzf (https://github.com/junegunn/fzf)

## Preview mode
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

## Set up key bindings and fuzzy completion
eval "$(fzf --bash)"

# end fzf

# zoxide (https://github.com/ajeetdsouza/zoxide)
eval "$(zoxide init bash)"

# eza (https://github.com/eza-community/eza)
alias e='eza --git'

#############################
# Machine-specific settings #
#############################

# Machine-specific settings after everything
specific_post_path=~/.bash_specific_post
# shellcheck source=.bash_specific_post
[[ -f "$specific_post_path" ]] && . "$specific_post_path"

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

# keychain (https://github.com/funtoo/keychain)
# Remember to change the key name
# eval "$(keychain --eval --agents ssh id_xxx)"

# nvm (https://github.com/nvm-sh/nvm)
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cargo (https://github.com/rust-lang/cargo)
# PATH="$PATH":~/.cargo/bin

# bob (https://github.com/MordechaiHadad/bob)
# PATH="$PATH":~/.local/share/bob/nvim-bin
