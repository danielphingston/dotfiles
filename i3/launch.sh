#!/usr/bin/env sh
export SXHKD_SHELL=/bin/sh
pgrep -x sxhkd > /dev/null || sxhkd &
xsetroot -cursor_name left_ptr &
nitrogen --restore &
pgrep -x compton > /dev/null || compton --config /home/danielphingston/.config/i3/compton.conf &
xrandr --output eDP-1 --brightness 0.85 &
wal -R &
pgrep -x clipnotify > /dev/null || clipmenud &

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch polybar
polybar -c /home/danielphingston/.config/i3/polybar.conf example &
