#!/bin/sh

# pre-commit
#
# run precommit:
# pc [run] [--dir <dir>]
#
# install precommit to a repo:
# pc init [--dir <dir>]
#
# append the name of a check to skip:
# pc skip <taskName>
#
# clear the list of checks to be skipped:
# pc skip-clear
#
pc() {
	readonly subcmd="$1"

	# autoupdate
	# help

	if [ -z "$subcmd" ] || [ "$subcmd" = "run" ]; then
		# check for --dir option

		git add .
		pre-commit run --all-files
	else
		case "$subcmd" in
			init)
				# check for --dir option
				pre-commit install --install-hooks --overwrite
				pre-commit install --install-hooks --overwrite --hook-type commit-msg
				;;
			skip-clear)
				unset SKIP
				;;
			skip)
				if [ -z "$2" ]; then
					echo "pc - error: specify the name of a task to skip"
					return
				fi

				for task_name in "$@"; do
					if [ -z "$SKIP" ]; then
						export SKIP="$task_name"
					else
						export SKIP="$SKIP,$task_name"
					fi
				done
				;;
			*)
				echo "Unknown subcommand '$subcmd' requested"
				return
		esac
	fi
}
