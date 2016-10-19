unset GREP_OPTIONS

source "${HOME}/.zgen/zgen.zsh"
# if the init scipt doesn't exist
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/brew-cask
    zgen oh-my-zsh plugins/bundler
    zgen oh-my-zsh plugins/coffee
    zgen oh-my-zsh plugins/node
    zgen oh-my-zsh plugins/osx
    zgen oh-my-zsh plugins/rbenv
    zgen oh-my-zsh plugins/ssh-agent
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh themes/bira

    # bulk load
    zgen loadall <<EOPLUGINS
        zsh-users/zsh-completions src
        zsh-users/zsh-syntax-highlighting
        felixr/docker-zsh-completion
        yonchu/grunt-zsh-completion
EOPLUGINS

    # save all to init script
    zgen save
fi

#autocomplete
autoload -U compinit && compinit
zmodload -i zsh/complist

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export TEMP=~/temp

# z stuff
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}

alias l='ls -l'
alias ll='ls -lah'
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
export NODE_PATH=/usr/local/lib/node_modules:./node_modules:$NODE_PATH

#tmuxinator
#[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator
#export EDITOR=/usr/local/bin/vim

#teamocil autocomplete
#compctl -g '~/.teamocil/*(:t:r)' teamocil

#remove rake tab completion
compdef -d rake

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/PARTICLE_CORE_VARS

alias resu='sudo $(history | tail -n1 | cut -c 8-)'

export NVM_DIR="~/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias ports="lsof -i -P | grep -i 'listen'"

#supermove
autoload -U zmv
alias mmv='noglob zmv -W'

export LESS="R"
export PATH="./node_modules/.bin:$PATH"

#Swift Package Manager
export TOOLCHAINS=swift
export PATH=/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:$PATH

#Tsung
export PATH=/usr/local/Cellar/tsung/1.6.0/lib/tsung/bin/:$PATH

PATH="~/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="~/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="~/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"~/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=~/perl5"; export PERL_MM_OPT;
