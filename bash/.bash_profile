#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# startx after login
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	startx
fi
