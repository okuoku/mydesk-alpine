#!/bin/sh

mkdir -p `dirname $0`/../home_dir_firefox

docker run -it --rm \
    -u 0:0 \
    -e XDG_RUNTIME_DIR=/runtime \
    -e XDG_CONFIG_DIRS=/etc:/etc/xdg:/usr/share \
    -e WAYLAND_DISPLAY=wayland-0 \
    -e HOME=/home \
    -e PULSE_SERVER=/runtime/PulseAudio \
    -e PULSE_COOKIE=/runtime/PulseCookie \
    -e PULSE_LATENCY_MS=50 \
    -e LANG=C \
    -v `dirname $0`/../runtime:/runtime \
    -v `dirname $0`/../files:/files \
    -v `dirname $0`/../home_dir_firefox:/home \
    -v $XDG_RUNTIME_DIR/$WAYLAND_DISPLAY:/runtime/wayland-HOST \
    -v /dev/dri:/dev/dri:rw \
    -v $HOME/.config/pulse/cookie:/runtime/PulseCookie \
    -v $XDG_RUNTIME_DIR/pulse/native:/runtime/PulseAudio \
    firefox bash
    
