# SOURCE: https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
# PURPOSE: Setup Nvidia Container Toolkit so containers can use the nvidia resources such as CUDA. Might be used for something like zed camera object detection.
# --------------------------------------------------------------------------------------------------

if docker run --rm --runtime=nvidia --gpus all ubuntu nvidia-smi
then
	echo "INFO: Skipping Nvidia Container Toolkit install because docker nvidia runtime already exists."
else
	echo "INFO: Attempting to install Nvidia Container Toolkit."
	# Installing with Apt 
	curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
	  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
	    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
	    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list # configure production repo
	sudo apt-get update
	sudo apt-get install -y nvidia-container-toolkit

	# Configuring Docker
	sudo nvidia-ctk runtime configure --runtime=docker
	sudo systemctl restart docker

	if sudo docker info | grep -q Runtimes:.*nvidia
	then
		echo "INFO: Nvidia Container Toolkit installed!"
	else
		echo "INFO: Failed to install Nvidia Container Toolkit. See https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html"
	fi
fi
