#!/bin/sh

# Copy Dockerfile to build the vapor app container

curl --remote-name https://raw.githubusercontent.com/pedantix/Vapor-Docker-Compose/master/Dockerfile
echo "Dockerfile downloaded"
curl --remote-name https://raw.githubusercontent.com/pedantix/Vapor-Docker-Compose/master/docker-compose.yml
echo "Docker Compile file downloaded"

echo "tmp/\n" >> .gitignore

echo "Updated gitignore file to ignore tmp folder created by docker for DB data"


