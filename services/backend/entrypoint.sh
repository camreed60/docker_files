#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/humble/setup.bash" --
source "/dev_ws/install/setup.bash" --
echo 'source "/opt/ros/humble/setup.bash" ' >> ~/.bashrc 
echo 'source "/dev_ws/install/setup.bash" ' >> ~/.bashrc 
# take in command line input and execute

if [[ -z "$BACKEND_COMMAND" ]]; then
  exec "$@"
else
  bash -c "$BACKEND_COMMAND"
fi

