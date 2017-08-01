# Git
alias g="git status"
alias gc="git commit"
alias gp='git push 2>&1 | $(grep "\--set-upstream")'
alias gl='git log --pretty=format:"[%h] %ae, %ar: %s" --stat'
alias gg='git log --pretty=oneline'
alias tempo='git log --all --oneline --decorate --author="Erica" --since="1.week" --pretty=format:"%h%x09%an%x09%ad%x09%s"'

alias bashp='vi ~/.bash_profile'
alias vi='vim'
alias vimrc='vi ~/.vimrc'
alias vimconfig='vi ~/.vim'
alias gitconfig='vi ~/.gitconfig'
alias gitignore='vi ~/.gitignore_global'
alias sourceb='source  ~/.bash_profile'
alias today='cal | grep -E --color "\b`date +%e`\b|$"'
alias ls='ls -G'
alias ltree='tree -L 1'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=$HOME/.node_modules/bin:$PATH

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

# setting the colors
if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    MAGENTA=$(tput setaf 9)
    ORANGE=$(tput setaf 172)
    GREEN=$(tput setaf 190)
    PURPLE=$(tput setaf 141)
    WHITE=$(tput setaf 3)
  else
    MAGENTA=$(tput setaf 5)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  MAGENTA="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\[${BOLD}${MAGENTA}\]\u \[${GREEN}\]\d \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n\$ \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
