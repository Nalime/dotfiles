#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# ==> RAINBOWS <==

alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Arch Linux
# https://man.archlinux.org/man/terminfo.5.en

declare -A format
format["reset"]="$(tput sgr0)"
format["bold"]="$(tput bold)"
format["italic"]="$(tput sitm)"
format["underline"]="$(tput smul)"

declare -A color
color["black"]="$(tput setaf 0)"
color["d_red"]="$(tput setaf 1)"
color["d_green"]="$(tput setaf 2)"
color["d_yellow"]="$(tput setaf 3)"
color["d_blue"]="$(tput setaf 4)"
color["d_purple"]="$(tput setaf 5)"
color["d_cyan"]="$(tput setaf 6)"
color["l_gray"]="$(tput setaf 7)"
color["d_gray"]="$(tput setaf 8)"
color["l_red"]="$(tput setaf 9)"
color["l_green"]="$(tput setaf 10)"
color["l_yellow"]="$(tput setaf 11)"
color["l_blue"]="$(tput setaf 12)"
color["l_purple"]="$(tput setaf 13)"
color["l_cyan"]="$(tput setaf 14)"
color["white"]="$(tput setaf 15)"

# FreeBSD
# https://www.freebsd.org/cgi/man.cgi?query=terminfo

# declare -A format
# format["reset"]="$(tput me)"
# format["bold"]="$(tput md)"
# format["italic"]="$(tput ZH)"
# format["underline"]="$(tput us)"
# 
# declare -A color
# color["black"]="$(tput Sf 0)"
# color["d_red"]="$(tput Sf 1)"
# color["d_green"]="$(tput Sf 2)"
# color["d_yellow"]="$(tput Sf 3)"
# color["d_blue"]="$(tput Sf 4)"
# color["d_purple"]="$(tput Sf 5)"
# color["d_cyan"]="$(tput Sf 6)"
# color["l_gray"]="$(tput Sf 7)"
# color["d_gray"]="$(tput Sf 8)"
# color["l_red"]="$(tput Sf 9)"
# color["l_green"]="$(tput Sf 10)"
# color["l_yellow"]="$(tput Sf 11)"
# color["l_blue"]="$(tput Sf 12)"
# color["l_purple"]="$(tput Sf 13)"
# color["l_cyan"]="$(tput Sf 14)"
# color["white"]="$(tput Sf 15)"

declare -A esc_format
for i in ${!format[@]}; do
    esc_format["$i"]="\001${format["$i"]}\002";
done

declare -A esc_color
for i in ${!color[@]}; do
    esc_color["$i"]="\001${color["$i"]}\002";
done

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
@${esc_format["bold"]}${esc_color["d_green"]}\h${esc_format["reset"]}\
)\$(prompt_face):\
${esc_format["bold"]}${esc_color["l_blue"]}\W${esc_format["reset"]}\
\\$ \
"

# Have less display colors
# from: https://wiki.archlinux.org/index.php/Color_output_in_console#man

# bold/blink
export LESS_TERMCAP_md=${format["bold"]}${color["l_purple"]}
export LESS_TERMCAP_me=${format["reset"]}

# underline
export LESS_TERMCAP_us=${format["italic"]}${format["underline"]}${color["l_gray"]}
export LESS_TERMCAP_ue=${format["reset"]}

# for konsole and gnome-terminal
export GROFF_NO_SGR=1

# ==> OTHER <==

# xclip aliases
alias xcopy='xclip -sel clip -i'
alias xpaste='xclip -sel clip -o'

# HUGE STACK FOR COMPETITIVE PROGRAMMING NEEDS
ulimit -s $((256 * 1024))

# Add user's ~/bin directory to PATH
PATH="$PATH":~/bin
