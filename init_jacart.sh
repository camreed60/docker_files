#!/bin/bash
IMAGE_NAME=jacart
CONTAINER_NAME=jacart

# check for enviroment variables
if [ -z "${VELODYNE_IFNAME}" ]; then
  echo "The enviroment variable \$VELODYNE_IFNAME needs to be set to the ethernet interface that the velodyne is connected to. This is likely the logical name of the network which has a pci bus, look for it by running \`lshw -C network\`." >&2
  return
fi
# install Nvidia Container Toolkit
source ./install_container_toolkit.sh
# do this to see gui applications (rviz2) from docker
sudo xhost local:root
# assign static ip to recieve velodyne data. For more information see page 23, 4.2.1 Network Setup in Isolation of the Velodyne Puck (VLP-16) User Manual (https://velodynelidar.com/wp-content/uploads/2019/12/63-9243-Rev-E-VLP-16-User-Manual.pdf).
sudo ip addr add 192.168.1.254/24 dev $VELODYNE_IFNAME
# start with docker
sudo docker build -t $IMAGE_NAME -f ./Dockerfile . 

XSOCK=/tmp/.X11-unix
sudo docker run --rm -it\
	--runtime=nvidia \
	-e DISPLAY=$DISPLAY \
	-v $XSOCK:$XSOCK \
	-v $HOME/.Xauthority:/root/.Xauthority \
	-v /dev:/dev \
	-v $HOME/dev_ws/src/maps:/dev_ws/src/maps \
	-v $HOME/dev_ws/rosbag2_2024_06_05-10_56_12:/rosbag \
	--privileged \
	--net=host \
	--name $CONTAINER_NAME \
	$IMAGE_NAME tmux
