#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ==> RAINBOWS <==

alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# In case the environment doesn't recognize xterm-kitty QwQ
# export TERM=xterm-256color

. ~/.bash_colors

# PS1

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

# Have less display colors
# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man

# bold/blink
export LESS_TERMCAP_md=${format["bold"]}${color["l_blue"]}
export LESS_TERMCAP_me=${format["reset"]}

# underline
export LESS_TERMCAP_us=${format["italic"]}${format["underline"]}${color["l_gray"]}
export LESS_TERMCAP_ue=${format["reset"]}

# ==> OTHER <==

# xclip aliases
alias xcopy='xclip -sel clip -i'
alias xpaste='xclip -sel clip -o'

# HUGE STACK FOR COMPETITIVE PROGRAMMING NEEDS
ulimit -s $((256 * 1024))

# If on virtual terminal and possible, set a bigger font
setfont ter-124b 2> /dev/null ; :

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/landy/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/landy/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/landy/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/landy/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

