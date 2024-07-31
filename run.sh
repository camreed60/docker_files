#!/bin/bash

# attempt to install requirements
bash ./require/all.sh

# do this to see gui applications (rviz2) from docker
sudo xhost local:root
# assign static ip (to all ethernet interfaces) to recieve velodyne data. For more information see page 23, 4.2.1 Network Setup in Isolation of the Velodyne Puck (VLP-16) User Manual (https://velodynelidar.com/wp-content/uploads/2019/12/63-9243-Rev-E-VLP-16-User-Manual.pdf).
sudo ip addr add 192.168.1.254/24 dev $(nmcli device status | awk '$2 == "ethernet" {print $1}') 

open_browser_when_ready () {
	until curl -s http://localhost:5173 > /dev/null
	do
	  echo "Waiting for port 5173 to open."
	  sleep 2
	done
	open http://localhost:5173
}

open_browser_when_ready & docker compose up --build --remove-orphans --force-recreate 


