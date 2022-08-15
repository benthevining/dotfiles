#!/bin/sh

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias python="python3"

alias pip="python3 -m pip"

mkcd() {
	mkdir -p "$@" && cd "_" || exit 1
}

alias aliases="alias | sed 's/=.*//'"

alias functions="declare -f | grep '^[a-z].* ()' | sed 's/{$//'"

alias paths='echo -e ${PATH//:/\\n}'

pip_update_all() {
	python3 -m pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 python3 -m pip install -U
}

alias cf="clang-format -i"
