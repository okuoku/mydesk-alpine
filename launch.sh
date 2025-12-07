#!/bin/sh

docker run -it --rm \
    -u 0:0 \
    -e XDG_RUNTIME_DIR=/runtime \
    -e XDG_CONFIG_DIRS=/etc:/etc/xdg:/usr/share \
    -e XDG_MENU_PREFIX=lxqt- \
    -e QT_PLATFORM_PLUGIN=lxqt \
    -e QT_QPA_PLATFORMTHEME=lxqt \
    -e WAYLAND_DISPLAY=wayland-HOST \
    -e WINEPREFIX=/prefix \
    -e HOME=/home \
    -e PULSE_SERVER=/runtime/PulseAudio \
    -e PULSE_COOKIE=/runtime/PulseCookie \
    -e PULSE_LATENCY_MS=50 \
    -e LANG=ja_JP.utf8 \
    -v `dirname $0`/config_dir:/home/.config \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/runtime/wayland-HOST \
    -v /dev/dri:/dev/dri:rw \
    -v $HOME/.config/pulse/cookie:/runtime/PulseCookie \
    -v $XDG_RUNTIME_DIR/pulse/native:/runtime/PulseAudio \
    mydesk /session.sh

