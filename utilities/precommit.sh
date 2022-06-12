#!/bin/sh

# pre-commit
#
# run precommit:
# pc [run] [--dir <dir>]
#
# install precommit to a repo:
# pc [init] [--dir <dir>]
#
pc() {
	readonly subcmd="$1"

	# check for --dir option

	# autoupdate

	if [ -z "$subcmd" ] || [ "$subcmd" = "run" ]; then
		git add .
		pre-commit run --all-files
	else
		case "$subcmd" in
			init)
				pre-commit install --install-hooks --overwrite
				pre-commit install --install-hooks --overwrite --hook-type commit-msg
				;;
			*)
				echo "Unknown subcommand '$subcmd' requested"
				exit 1
		esac
	fi
}
