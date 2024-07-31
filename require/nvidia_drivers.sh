#!/bin/bash

# install nvidia drivers
if nvidia-smi --version
then
        echo "Nvidia drivers we're found."
else
	wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
	sudo dpkg -i cuda-keyring_1.1-1_all.deb
	rm cuda-keyring_1.1-1_all.deb
	sudo apt-get update
	sudo apt-get -y install cuda-toolkit-12-5


        sudo apt-get update
	sudo apt-get install -y nvidia-driver-555-open
	sudo apt-get install -y cuda-drivers-555
        echo "-------------------------------------------------------"
        echo "Since new drivers needed to be installed you may need to restart the host before everything will work..."
        sleep 20
fi

