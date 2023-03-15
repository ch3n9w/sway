
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-extract/extract.plugin.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-autoswitch-virtualenv/zsh-autoswitch-virtualenv.plugin.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

autoload -U compinit; compinit

zstyle ':completion:*:default' list-colors '=(#b)(-*)(-- *)===34' '=(#b)(-- *)=34'
# zstyle ':completion:*' list-colors '=*=34'
zstyle ':completiom:*' list-colors 'di=1:fi=96:*.m=31:*.py=32:*.txt=36:*.out=35'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}  


