FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get upgrade
RUN apt-get update && apt-get install -y wget
RUN wget -O /tmp/nodesource_setup.sh https://deb.nodesource.com/setup_22.x 
RUN bash /tmp/nodesource_setup.sh
RUN apt-get install -y nodejs

RUN apt-get install -y python3 build-essential tmux git

WORKDIR /
RUN git clone https://github.com/JACart2/ui.git
WORKDIR /ui
RUN npm install
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/bin/bash","/entrypoint.sh"]
