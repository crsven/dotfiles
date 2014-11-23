#!/usr/bin/env sh
DOTVERSION=0.0.1

function dot() {
  (( $# )) || (echo "No arguments provided." && dot-usage)

  # check for version, and help
  for arg in "$@"
  do
    case $arg in
      -h|--help)
        dot-usage
        return
        ;;
      -v|--version)
        echo $DOTVERSION
        return
        ;;
    esac
  done

  # try to run command
  command -v $0-$1 >/dev/null && $0-$1 ${@:2} || echo "No such command '$1'"
}

function dot-ls() {
  find ${1-$PWD} -name '.*' -maxdepth 1 -not -iwholename '.' -not -iwholename '*.git' -not -iwholename '*.gitmodules' | xargs -I {} basename {}
}

function dot-ln() {
  source=${1-$PWD}
  target=${2-$HOME}
  dot-check-ln $source $target || dot-ls $source | xargs -I {} ln -s $source/{} $target/{}
}

function dot-rm() {
  source=${1-$PWD}
  target=${2-$HOME}
  dot-check-rm $source $target || dot-ls $source | xargs -I {} rm $target/{}
}

#
# Checking for things
#

function dot-check-rm() {
  dot-check-args "$@" && dot-ls $1 | xargs -I {} sh -c "[[ -e $2/{} && ! -h $2/{} ]] || exit 1"
}

function dot-check-ln() {
  dot-check-args "$@" && dot-ls $1 | xargs -I {} sh -c "[ -e $2/{} ] || exit 1"
}

function dot-check-args() {
  ${1?"Specify the source directory as the first argument"}
  ${2?"Specify the target directory as the second argument"}
}

#
# Usage docs
#

function dot-usage() {
  cat << EOF
Usage: dot [-v|--version] [-h|--help] <command> [<options>]
Options:
  -h, --help       Show this help message
  -v, --version    Show version

Commands:
  ls              List all of the dotfiles in the current
                  directory
  ln              Create symlinks of all dotfiles in current
                  directory from \$HOME
  rm              Remove symlinks of all dotfiles in current
                  directory from \$HOME
EOF
}
