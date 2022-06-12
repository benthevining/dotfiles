#!/bin/sh

# This is the main entry point for my dotfiles
# your shell's startup script just needs to source this file

dotfiles_dir="$(cd "$(dirname "$0")" && pwd)"

. "$dotfiles_dir/utilities/cmake.sh"
. "$dotfiles_dir/utilities/dotfiles.sh"
. "$dotfiles_dir/utilities/functions.sh"
. "$dotfiles_dir/utilities/precommit.sh"

tabs 5,9,13,17,21,25,29,33,37,41,45,49,53,57,61,65,69,73,77

case "$(uname -s)" in
	Darwin)
		. "$dotfiles_dir/os_specific/macos.sh"
		;;
esac

# shellcheck disable=SC2139
alias sysupdate=". $dotfiles_dir/update_all.sh"
