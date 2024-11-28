#! /usr/bin/sh

# startx after login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	startx
fi

# Created by `pipx` on 2024-08-10 03:39:04
export PATH="$PATH:$HOME/.local/bin"
