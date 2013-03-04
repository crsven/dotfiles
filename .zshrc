# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails3 ruby homebrew bundler gem rvm tmux)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export TEMP=/Users/crsven/temp

# z stuff
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

alias l='ls -l'
alias ll='ls -la'
alias ber='bundle exec rake'
alias bec='bundle exec cucumber'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

source /Users/crsven/.rvm/scripts/rvm

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
function _get_tags {
  [ -f ./tags ] || return
  local cur
  read -l cur
  echo $(echo $(awk -v ORS=" "  "/^${cur}/ { print \$1 }" tags))
}

export VIM=/usr/local/share/vim/vim73
#compctl -x 'C[-1,-t]' -K _get_tags -- vim
#end vim tags
#autoload -U compinit
#compinit

export NODE_PATH=/usr/local/lib/node_modules

#tmuxinator
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
export EDITOR=/usr/local/bin/vim

#teamocil autocomplete
compctl -g '~/.teamocil/*(:t:r)' teamocil

#carbometer
source ~/.carbometer-env-variables

#zest
source ~/.zest-tests

#virtualenv
source /usr/local/bin/virtualenvwrapper.sh

#remove rake tab completion
compdef -d rake

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
