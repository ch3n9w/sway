
xdg_fzf() {
    local fzf_result=$(fzf)
    local directory=$(dirname $fzf_result)
    if [ -z "$fzf_result" ]
    then
        echo "No file specific"
    else
        # xdg-open $fzf_result &
        cd $directory
    fi
}
man() {
    local width=$(tput cols)
    [ $width -gt $MANWIDTH ] && width=$MANWIDTH
    env MANWIDTH=$width \
    man "$@"
}
# make alacritty show current directory in title
precmd() {
    [[ $TERM == "xterm-256color" ]] && print "\033]0;:> $(pwd)"
}

code()
{
    if [ -d "${1}" ]; then
        local dir="${1}"
        shift 1
        ( cd "${dir}" && nvim "." "${@}" )
    else
        nvim "${@}"
    fi
}

