#!/bin/bash

# install requirements and initalization for host
bash ./require/all.sh
bash ./initialize_host.sh

open_browser_when_ready () {
	until curl -s http://localhost:5173 > /dev/null
	do
	  echo "Waiting for port 5173 to open."
	  sleep 2
	done
	open http://localhost:5173
}

open_browser_when_ready & docker compose up --build --remove-orphans --force-recreate 


