# docker_files
Dockerfile and scripts for complete setup and operation of a JACart.

# Required Hardware
1. x86_64 unix system
1. graphics card that supports nvidia CUDA

# Installation

## Convience Script
Convience script `source ./require/all.sh`. Tested on Linux Mint 21/Ubuntu 22.04. Don't rely on this working for other distributions.

## Prerequite Depedencies.

1. Nvidia Cuda Drivers
1. Docker Engine
1. Nvidia Container Toolkit

# Running

## Convienence Script
Run `source ./run.sh` from main directory of this repo will run everything for full operation of the cart. Not praticial for development use.

## Manual Running

### Docker Compose Services
There are two services that build and run isolated enviroments with all the necessary depedenceies. These can be found in the `/services` directory. These are:
1. frontend: the user iterface that the passanger uses to select destinations and observe the route the cart has planned.
1. backend: everything else (except arduino code) which includes localization, velodyne drivers, zed camera packages, ros bridge for communicating with the ui, the simulator, and more

### Running The Services Individually
If the container isn't already running `docker compose run --rm -it backend bash` will open a terminal for the backend. Its recommended to first run `docker run --help` to see what each flag does. Switch out `backend` with `frontend` to do the same for the front end.

If the container is already running, use `docker compose exec <service name> <command>` instead.

Also it might be usefull to take a look at `docker compose up --help`.




