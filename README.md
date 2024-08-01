# docker_files
Dockerfile and scripts for complete setup and operation of a JACart.

# Required Hardware/Software
1. x86_64 unix system
1. graphics card that supports nvidia CUDA
1. Linux Mint 21.3 or Ubuntu 22.04 (other distributions haven't been tested, and installation scripts wouldn't work on them).

# Installation

First clone this repo.

## Required Dependencies

`bash ./require/all.sh` will

1. [Install Nvidia Cuda Drivers](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=22.04&target_type=deb_network)

1. [Install Docker Engine](https://docs.docker.com/engine/install/ubuntu/)
1. [Install NVIDIA Container Toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)

However, consider doing this manually.

# Running
`bash ./run.sh` will run everything for full operation of the cart including initializing the host. This does the steps below for you. This not praticial for development use.

## Initialize Host

`bash ./initialize_host` will 

1. Assign static IP of **192.168.1.254/24** to establish connection with Velodyne Lidar.
1. Allow the docker containers to access the host's X server.

## Docker Compose

`docker compose up` starts the frontend (user interface) and backend (all ros2 nodes & rviz2) services. Refer to [./compose.yaml](./compose.yaml) and ["How Compose works"](https://docs.docker.com/compose/compose-application-model/). 

# Development



