#!/bin/bash
#
# this is a modified version of the same script from github.com/jessfraz/dotfiles
#
set -e
set -o pipefail

ERRORS=()

# find all executables and run `pylint`
for f in $(find . -type f -not -path '*.git*' | sort -u); do
	if file "$f" | grep --quiet Python; then
		{
			pylint "$f" && echo "[OK]: successfully pylinted $f"
		} || {
			# add to errors
			ERRORS+=("$f")
		}
	fi
done


if [ ${#ERRORS[@]} -eq 0 ]; then
	echo "No errors, hooray"
else
	echo "These files failed pylint: ${ERRORS[*]}"
	exit 1
fi

