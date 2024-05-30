#!/usr/bin/env bash
# shellcheck disable=SC2086,SC2124

set -e

# Set X display variables
set_x_display() {
    MOUNT_X="-e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix"
    xhost + >/dev/null
}

# Set devices variables
set_devices() {
    ARDUINO="--device=/dev/ttyUSB0"
}

# Main script execution
main() {
    set_x_display
    set_devices
    # Launch the container
    set -x
    docker run -it --rm --net=host ${MOUNT_X} ${ARDUINO} \
        -e XAUTHORITY=${XAUTHORITY} ai-navigation /bin/bash
}

# Execute the main script
main "$@"
