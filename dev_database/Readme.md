# Installation guide

Make sure you have Docker and Python3 installed.

## Docker installation
Follow the instructions [here](https://docs.docker.com/install/).

## Python installation
Use your package manager to install Python3 then install the pymongo package using pip.
```bash
python3 -m pip install pymongo
```

## First time setup
```
chmod +x init.sh
./init.sh [PORT]
```

## Further runs
```
docker run auth_db
docker run user_db
```
Default ports are 27017 for auth_db and 27018 for user_db