# SOURCE: https://docs.docker.com/engine/install/ubuntu/
# --------------------------------------------------------------------------------------------------

if docker -v 
then
	echo "INFO: Docker already installed. Skipping installation."
else
	echo "INFO: Attempting to install Docker."
	
	# Add Docker's official GPG key:
	sudo apt-get update
	sudo apt-get install -y ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc

	# Add the repository to Apt sources:

	if [[ "$(. /etc/os-release && echo "$ID")" -eq "linuxmint" ]]
	then
		v="$(. /etc/os-release && echo "$UBUNTU_CODENAME")"
	else
		v="$(. /etc/os-release && echo "$VERSION_CODENAME")"
	fi
	echo "------------------------------"
	echo $v
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $v stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update	

	sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	

	# post-install step. Add user to docker group

	sudo groupadd docker
	sudo usermod -aG docker $USER
	newgrp docker

	if docker -v
	then
		echo "INFO: Docker installed!"
	else
		echo "INFO: Failed to install Docker. See https://docs.docker.com/engine/install/ubuntu/"
	fi
fi
