#!/bin/sh

dotfiles_impl_dotfiles_dir="$(cd "$(dirname "$0")" && pwd)/.."

# dotfiles
#
# dotfiles update
#
# dotfiles help
#
# dotfiles open
#
# dotfiles pull
#
dotfiles() {
	case "$1" in
		update)
			# add source/include lines to files in home dir
			;;
		help)
			# print help
			;;
		open)
			# open in IDE
			;;
		pull)
			# git pull
			# reload
			dotfiles update
			;;
		reload)
			# resource dotfiles
			. "$dotfiles_impl_dotfiles_dir/main.sh"
			;;
		*)
			echo "Unknown subcommand $1 requested"
			exit 1
	esac
}
