#!/bin/sh

dotfiles_impl_dotfiles_dir="$(cd "$(dirname "$0")" && pwd)/.."

#

dotfiles_print_help() {
	cat << EOF

dotfiles management command

usage:

	dotfiles clean
		Cleanup temporary files.

	dotfiles go
		cd to the dotfiles git directory.

	dotfiles help
		Print this message.

	dotfiles open
		Open the dotfiles in an IDE.

	dotfiles pull
		Update the local copy of the dotfiles repo from git.

	dotfiles update
		Update the system dotfiles with links to the dotfiles downloaded from git.

	dotfiles reload
		Re-source the main.sh shell script.
EOF
}

#

dotfiles_update() {
	# add source/include lines to files in home dir
	true;
}

#

dotfiles_pull() {
	cd "$dotfiles_impl_dotfiles_dir" && git fetch && git pull
	. "$dotfiles_impl_dotfiles_dir/main.sh"
	dotfiles_update
}

#

dotfiles_clean() {
	brew cleanup
	gem cleanup

	cd "$dotfiles_impl_dotfiles_dir" && make clean
}

#

dotfiles() {
	case "$1" in
		clean) dotfiles_clean ;;
		go) cd "$dotfiles_impl_dotfiles_dir" || exit 1 ;;
		help) dotfiles_print_help ;;
		open) cd "$dotfiles_impl_dotfiles_dir" && make open ;;
		pull) dotfiles_pull ;;
		update) dotfiles_update ;;
		reload)
			# re-source dotfiles
			. "$dotfiles_impl_dotfiles_dir/main.sh"
			;;
		"") dotfiles_print_help ;;
		*)
			echo "Unknown subcommand $1 requested"
			return
	esac
}
