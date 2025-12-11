#!/bin/sh

mkdir -p `dirname $0`/runtime
mkdir -p `dirname $0`/files

docker run -it --rm \
    -u 0:0 \
    -e DBUS_SESSION_BUS_ADDRESS=unix:path=/runtime/dbus \
    -e XDG_RUNTIME_DIR=/runtime \
    -e XDG_CONFIG_DIRS=/etc:/etc/xdg:/usr/share \
    -e FCITX_ADDON_DIRS=/opt/skk/lib/fcitx5:/usr/lib/fcitx5 \
    -e XDG_DATA_DIRS=/opt/skk/share:/usr/local/share:/usr/share \
    -e HOME=/home \
    -e PULSE_LATENCY_MS=50 \
    -e LANG=ja_JP.utf8 \
    -v `dirname $0`/runtime:/runtime \
    -v `dirname $0`/files:/files \
    -v `dirname $0`/config_dir:/home/.config \
    mydesk /session-headless.sh

