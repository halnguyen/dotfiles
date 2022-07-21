#! /usr/bin/bash

# Brightness control

DEVICE=gmux_backlight

function polybar_ipc () {
	if pgrep -x polybar > /dev/null;then
		if pgrep -x redshift > /dev/null;then
			polybar-msg action "#brightness.hook.1"
		else 
			polybar-msg action "#brightness.hook.0"
		fi
	fi
}

case $1 in
	up)
		brightnessctl -d $DEVICE set +2%
		polybar_ipc
		;;
	down)
		brightnessctl -d $DEVICE set 2%-
		polybar_ipc
		;;
	*)
		polybar_ipc
		;;
esac