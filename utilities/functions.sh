#!/bin/sh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias l="ls -la"

alias listdir="ls -ld */"

mkcd() {
	mkdir -p "$@" && cd "_" || exit 1
}

alias aliases="alias | sed 's/=.*//'"

alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"

alias paths='echo -e ${PATH//:/\\n}'
