#!/bin/bash
set -e

# setup ros2 environment
source "/opt/ros/humble/setup.bash" --
source "/root/ros2_ws/install/local_setup.bash" --

# Welcome information
echo "JACart Docker Image"
echo "---------------------"  
echo "Available Packages:"
ros2 pkg list
echo "---------------------"    
exec "$@"
