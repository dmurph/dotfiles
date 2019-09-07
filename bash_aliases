alias la='command ls -AlG'
alias lc='command ls -lAcrG'
alias lk='command ls -lASrG'
alias lll='stat %a %N %G %U ${PWD}/*|sort'
alias lr='command ls -lARG'
alias lt='command ls -lAtrG'
alias lu='command ls -lAurG'
alias lx='command ls -lAxBG'

alias analyze_used_commands='cut -f1 -d" " ~/.bash_history | sort | uniq -c | sort -nr | head -n 30'

if [ -f /usr/share/vim/vim74/macros/less.vim ]; then
    alias vless='vim -u /usr/share/vim/vim74/macros/less.vim'
fi

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cd..='cd ..'

alias realias="source $DIR/bash_aliases"
alias serve='python -m SimpleHTTPServer 8000'
