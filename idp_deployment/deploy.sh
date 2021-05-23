#!/bin/bash -xeu

set -a
. .env

NO_WORKERS=2
source .env
# printf "$MONGO_USER" | docker secret create mongo_user -
# printf "$MONGO_PASS" | docker secret create mongo_pass -
# printf "$AUTH_DB" | docker secret create auth_db -
# printf "$ACCT_DB" | docker secret create acct_db -

MANAGER_IP=$(ifconfig vboxnet0 | grep 'inet ' | cut -d' ' -f10)
echo "ADDR=$MANAGER_IP" > web.env
cp docker-compose-swarm.yaml docker-compose-swarm.yaml2
sed -i 's/MANAGER_IP/'"${MANAGER_IP}"'/g' docker-compose-swarm.yaml2

_output="$(docker swarm init --advertise-addr $MANAGER_IP)"
_join_cmd=$(echo "$_output" | grep $MANAGER_IP | xargs echo -n)

printf "$MONGO_INITDB_ROOT_USERNAME" | docker secret create mongo_initdb_root_username -
printf "$MONGO_INITDB_ROOT_PASSWORD" | docker secret create mongo_initdb_root_password -
printf "$MONGO_INITDB_DATABASE" | docker secret create mongo_initdb_database -

for i in $(seq 1 $NO_WORKERS); do
    docker-machine create worker$i
    docker-machine ssh worker$i $_join_cmd
done

docker run -d --name nfs --privileged -p 2049:2049 -v $(pwd)/data:/nfsshare -e SHARED_DIRECTORY=/nfsshare itsthenetwork/nfs-server-alpine:latest
docker stack deploy -c docker-compose-swarm.yaml2 test
