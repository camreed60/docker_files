#!/bin/bash

# install nvidia drivers
if nvidia-smi --version
then
        echo "Nvidia drivers we're found."
else
        apt-get install -y cuda-drivers
        echo "-------------------------------------------------------"
        echo "Since new drivers needed to be installed you may need to restart the host before everything will work..."
        sleep 20
fi

