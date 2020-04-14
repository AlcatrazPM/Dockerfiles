#!/bin/bash

PORT=27017
PORTT=0

[ -z $(which docker) ] && echo "Make sure you have docker installed\n" && exit 1

[ ! -z $1 ] && PORT=$1
PORTT=$(( PORT+1 ))

sudo docker volume create auth_data
sudo docker volume create user_data

#Comment this to use Dockerfile
sudo docker run -p $((PORT)):27017 -d -v auth_data:/data/db --name auth_db mongo
sudo docker run -p $((PORTT)):27017 -d -v user_data:/data/db --name user_db mongo

# Uncomment this to use Dockerfile
# sudo docker build -t my_mongo:latest .
# sudo docker run --publish $((PORT)):27017 --detach -v mongodb_data:/data/db --name mongo my_mongo

python3 create_database.py $((PORT))
