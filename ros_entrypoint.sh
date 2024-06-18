#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/humble/setup.bash" --
source "/dev_ws/install/local_setup.bash" --

# take in command line input and execute
echo "Successfully started JACart container. You can run a ros2 launch here."
exec "$@"
