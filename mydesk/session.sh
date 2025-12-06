#!/bin/sh
export FCITX_ADDON_DIRS=/opt/skk/lib/fcitx5:/usr/lib/fcitx5
export XDG_DATA_DIRS=/opt/skk/share:/usr/local/share:/usr/share
eval `dbus-launch --auto-syntax`

# DBus clients (Move to labwc autolaunch)
fcitx5 &

# Launch compositor
exec labwc
