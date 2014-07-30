export TERM=xterm-256color
export EDITOR=vim
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
NODE_PATH=$NODE_PATH:/usr/local/lib/node
export NODE_PATH
export ANDROID_SDK_ROOT=/usr/local/Cellar/android-sdk/r7/
alias ll='ls -la'
alias gi='gem install --no-ri --no-rdoc'
alias emulator='emulator -partition-size 128'
alias downloads='cd ~/Downloads/'
alias docs='cd ~/Documents/'
alias rmorig='rm `find ./ -name "*.orig"`'
alias csslint='csslint --rules=universal-selector,empty-rules,display-property-grouping,floats,font-faces,font-sizes,zero-units,vendor-prefix,gradients,important,compatible-vendor-prefixes,duplicate-properties'
alias csslintthis='find ./ \( -iname "*.css" ! -iname "*jquery*" ! -iname "*fancybox*" ! -iname "*selector.css" ! -iname "*admin.css" \) | xargs csslint --rules=universal-selector,empty-rules,zero-units,vendor-prefix,gradients,important,compatible-vendor-prefixes,duplicate-properties'
alias be='bundle exec'
alias cuke='bundle exec cucumber -r features/'
alias sane='stty sane'
alias tmux='tmux -2'
alias mux='tmux attach-session -t '
alias muxinate='tmuxinator start'
alias tmls='tmux list-sessions'
title(){
  echo -n -e "\033]0;$1\007"
}

rdel(){
  find . -name $1 -ok rm {} \;
}

bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

function parse_git_branch () {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

# COLORS FOR PROMPTS
function SHOW_COLORS () { for code in {0..255}; do echo -e "\e[38;05;${code}m $code: Test"; done }
function FORE_COLOR () { echo -ne "\[\e[38;5;$1m\]"; }
function BACK_COLOR () { echo -ne "\[\e[48;5;$1m\]"; }
# old pink color: PS1="\[\e[45m\]--------------------\[\e[0m\]\n$PS1"
export PS1="`FORE_COLOR 34`<-----\[\e[0m\] `FORE_COLOR 92`\!\[\e[0m\] | `FORE_COLOR 92`\u@\H\[\e[0m\] | `FORE_COLOR 92`\@\[\e[0m\] `FORE_COLOR 34`----->\[\e[0m\]\n[\w$YELLOW\$(parse_git_branch)$NO_COLOUR]$ "
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export RUBYOPT=rubygems

export VIDIR_EDITOR_ARGS='-c :set nolist | :set ft=vidir-ls'
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator

# Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

export TEMP=~/temp
