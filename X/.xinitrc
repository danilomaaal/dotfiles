
userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# set background
sh /home/danilo/.fehbg &

# status bar configuration loooop
while true; do
	slstatus # status bar on
	xsetroot -name "$(cat /sys/class/power_supply/BAT0/capacity)"
	sleep 1m    # Update time every minute
done &

# ececute xrdb - resource database manager for X resources
exec xrdb &
# picom compositor for X11
picom &
# custom key bindings 
xbindkeys &
# redshift
redshift &
# and window manager
dwm
