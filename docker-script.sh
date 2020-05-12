#!/bin/bash
docker pull bllmhd/hardis-awesome-app:latest 
if [ ! "$(docker ps -a | grep hardis-awesome-app)" ]; then
docker stop hardis-awesome-app
docker rm hardis-awesome-app
fi
docker run --restart always --name hardis-awesome-app -p 9999:9999 -d bllmhd/hardis-awesome-app:latest
