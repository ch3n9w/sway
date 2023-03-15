
# keybindings must be provided after plugin source
bindkey -e
bindkey -s '\er' 'ranger\n'
bindkey -s '\ef' 'xdg_fzf\n'
bindkey -s '\ed' 'dolphin .\n'
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

bindkey '^H' backward-kill-word
