#!/bin/bash
#
# this is a modified version of the same script from github.com/jessfraz/dotfiles
#
set -e
set -o pipefail

ERRORS=()

# find all executables and run `shellcheck`
for f in $(find . -type f -not -path '*.git*' -not -path "*.cache*" -not -path '*clones*' -not -path '*.cargo*' | sort -u); do
	if file "$f" | grep --quiet shell; then
		{
			shellcheck "$f" && echo "[OK]: successfully linted $f"
		} || {
			# add to errors
			ERRORS+=("$f")
		}
	fi
done

if [ ${#ERRORS[@]} -eq 0 ]; then
	echo "No errors, hooray"
else
	echo "These files failed shellcheck: ${ERRORS[*]}"
	exit 1
fi
