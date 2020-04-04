#!/bin/bash

[ -z $(which git) ] && "Make sure you have git installed\n" && exit 1
[ -z $(which docker) ] && "Make sure you have Docker installed\n" && exit 1

git clone https://github.com/AlcatrazPM/Backend.git

sudo docker build -t alcatraz_backend:latest .
sudo docker run -d -p 8082:8082 --name backend alcatraz_backend

rm -rf Backend