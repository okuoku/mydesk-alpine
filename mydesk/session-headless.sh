#!/bin/sh
export FCITX_ADDON_DIRS=/opt/skk/lib/fcitx5:/usr/lib/fcitx5
export XDG_DATA_DIRS=/opt/skk/share:/usr/local/share:/usr/share
dbus-daemon --session --fork --address=$DBUS_SESSION_BUS_ADDRESS &
sleep 2
exec fcitx5

