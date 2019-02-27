#--------------------------
# Path and file exploration
#--------------------------
alias cdc="cd .."
alias cdcc="cd ../../"
alias cc='clear'

#get full path of any file
alias readlink='readlink -f'

# count number of files in a folder
alias lswc='find . -maxdepth 1 -type f | wc -l'
#Can never remember how to use find properly
alias trouve='find . -name'

#----------------------
# Networking
#----------------------
alias wget='wget -c'
alias rsync='rsync --progress -v -rL'
#Alias to connect to the bird2 cluster
alias bird="ssh -X foucal-a@bird2login.univ-nantes.fr"


#------------------------
# File size and cleaning
#------------------------
alias usage='du -hsc * | sort -rh'


#---------------------
# Typo proof aliases
#---------------------
alias sl='ls'
alias dc='cd'
alias kmdir='mkdir'
alias eg='tldr'

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gc='git commit -a'
alias gcm='git commit -m'
alias s="git status"


#-----------------------
# Job execution
#-----------------------
alias psme='ps -ef | grep $USER --color=always'
alias psg='ps -ef | grep --color=always'

#----------------------
# Tmux related commands
#----------------------
alias tnew='tmux new -s'
alias tls='tmux ls'


