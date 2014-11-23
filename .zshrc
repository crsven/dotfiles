source ~/personal/dotfiles/antigen/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/

antigen theme robbyrussell/oh-my-zsh themes/bira

antigen bundle git
antigen bundle rails
antigen bundle ruby
antigen bundle brew
antigen bundle brew-cask
antigen bundle bundler
antigen bundle gem
antigen bundle rbenv
antigen bundle tmux
antigen bundle ssh-agent
antigen bundle coffee
antigen bundle node
antigen bundle osx
antigen bundle zsh-users/zsh-completions src

antigen apply

#autocomplete
autoload -U compinit && compinit
zmodload -i zsh/complist

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export TEMP=/Users/crsven/temp

# z stuff
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

alias l='ls -l'
alias ll='ls -lahL'
alias ber='bundle exec rake'
alias bec='bundle exec cucumber'

#Add rbenv shims
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# fixing auto correct
alias git='nocorrect git'
alias bundle='nocorrect bundle'

# don't overwrite my Tmux names
DISABLE_AUTO_TITLE=true

# trying to get history search
autoload -U history-search-end

zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '\e[A' history-beginning-search-backward-end
bindkey '\e[B' history-beginning-search-forward-end

#vim tags
#function _get_tags {
#  [ -f ./tags ] || return
#  local cur
#  read -l cur
#  echo $(echo $(awk -v ORS=" "  "/^${cur}/ { print \$1 }" tags))
#}

export VIM=/usr/local/share/vim/vim74
export VIMRUNTIME="/usr/local/share/vim/vim74"
export NODE_PATH=/usr/local/lib/node_modules

#tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export EDITOR=/usr/local/bin/vim

#teamocil autocomplete
#compctl -g '~/.teamocil/*(:t:r)' teamocil

#remove rake tab completion
compdef -d rake

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
