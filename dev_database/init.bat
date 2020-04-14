set /A PORT=27017
set /A PORTT=27018


docker volume create auth_data
docker volume create user_data

REM Comment this to use Dockerfile
docker run --publish %PORT%:27017 --detach -v auth_data:/data/db --name auth_db mongo
docker run --publish %PORTT%:27017 --detach -v user_data:/data/db --name user_db mongo


REM Uncomment this to use Dockerfile
REM docker build -t my_mongo:latest .
REM docker run --publish $((PORT)):27017 --detach -v mongodb_data:/data/db --name mongo my_mongo



REM Usually this fails, please run separately.
REM Also maybe install `MongoDB Compass` on Windows for GUI
REM python3 create_database.py %PORT%