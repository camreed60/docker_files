#!/bin/bash
IMAGE_NAME=jacart
CONTAINER_NAME=jacart

# install nvidia drivers
if nvidia-smi --version
then
	echo "Nvidia drivers we're found."
else
	sudo apt-get install -y cuda-drivers
	echo "-------------------------------------------------------"
	echo "Since new drivers needed to be installed you may need to restart the host before everything will work..."
	sleep 20
fi
# install docker
source ./install_docker.sh

# install Nvidia Container Toolkit
source ./install_container_toolkit.sh

# do this to see gui applications (rviz2) from docker
sudo xhost local:root
# assign static ip (to all ethernet interfaces) to recieve velodyne data. For more information see page 23, 4.2.1 Network Setup in Isolation of the Velodyne Puck (VLP-16) User Manual (https://velodynelidar.com/wp-content/uploads/2019/12/63-9243-Rev-E-VLP-16-User-Manual.pdf).
sudo ip addr add 192.168.1.254/24 dev $(nmcli device status | awk '$2 == "ethernet" {print $1}') 
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
	--privileged \
	--net=host \
	--name $CONTAINER_NAME \
	$IMAGE_NAME tmux
