#!/bin/bash

PORT=27017

[ -z $(which docker) ] && echo "Make sure you have docker installed\n" && exit 1

[ ! -z $1 ] && PORT=$1

sudo docker volume create mongodb_data

#Comment this to use Dockerfile
sudo docker run --publish $((PORT)):27017 --detach -v mongodb_data:/data/db --name mongo mongo

# Uncomment this to use Dockerfile
# sudo docker build -t my_mongo:latest .
# sudo docker run --publish $((PORT)):27017 --detach -v mongodb_data:/data/db -name mongo my_mongo

python3 create_database.py $((PORT))
