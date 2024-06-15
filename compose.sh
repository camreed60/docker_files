# do this to see gui applications from docker
xhost local:root
# assign static ip to recieve velodyne data
ip addr add 192.168.1.254/24 dev enp0s31f6
# start with docker
sudo docker compose -f ./compose.yaml up --force-recreate --build
