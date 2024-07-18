#!/bin/bash

# attempt to install requirements
bash ./require/all.sh

# do this to see gui applications (rviz2) from docker
sudo xhost local:root
# assign static ip (to all ethernet interfaces) to recieve velodyne data. For more information see page 23, 4.2.1 Network Setup in Isolation of the Velodyne Puck (VLP-16) User Manual (https://velodynelidar.com/wp-content/uploads/2019/12/63-9243-Rev-E-VLP-16-User-Manual.pdf).
sudo ip addr add 192.168.1.254/24 dev $(nmcli device status | awk '$2 == "ethernet" {print $1}') 


#!/bin/bash

# Create a new session named 'jacart_main'
tmux new-session -d -s jacart_main

# Rename the first window
tmux rename-window -t jacart_main:0 'Main'

# Send commands to each pane
tmux send-keys -t jacart_main:0.0 'docker compose up --force-recreate' C-m 

tmux new-window
sleep 5
tmux send-keys -t jacart_main:1.0 'open http://localhost:5173 && exit' C-m

# Attach to the session
tmux attach -t jacart_main
