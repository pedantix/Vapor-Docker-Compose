# Vapor Docker Compose

## Rationale 
Using Docker and Ngrok we can develop client applications for our Vapor APIs easily without having to standup a developmental instance on a 3rd party service such as heroku or vapor cloud. 

## Requirements

* Vapor Toolbox
* Docker version 18+


## Usage - with sample project

1. `vapor update` # install the packages
2. `docker-compose  build` # build the docker containers
3. `docker-compose up` # starts the containers
4. navigate to localhost:4040 # expose ngrok urls
5. click on ngrok link to have access to your local docker

## Usage - with your project

*TODO!*

## TODOS

* script to install starter dockers scripts "Dockerfile" and "docker-compose.yml" into another vapor project to use as a template


## Notes

Docker will create a temp file for persistent data like the postgresql volume
