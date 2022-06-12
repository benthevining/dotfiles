#!/bin/zsh

# this file configures ZSH-specific options and includes main.sh

setopt AUTO_PUSHD
setopt CDABLE_VARS

setopt ALWAYS_TO_END
setopt AUTO_MENU

setopt BAD_PATTERN

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY

export HISTFILE="${HISTFILE:-${ZDOTDIR:-$HOME}/.zsh_history}"

source "$(cd "$(dirname "$0")" && pwd)/../main.sh"

alias hist="tail -n 10 ~/.zsh_history"

alias reload="source ~/.zshrc"
