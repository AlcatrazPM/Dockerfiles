set /A PORT=27017


docker volume create mongodb_data

REM Comment this to use Dockerfile
docker run --publish %PORT%:27017 --detach -v mongodb_data:/data/db --name mongo mongo


REM Uncomment this to use Dockerfile
REM docker build -t my_mongo:latest .
REM docker run --publish $((PORT)):27017 --detach -v mongodb_data:/data/db --name mongo my_mongo



REM Usually this fails, please run separately.
REM Also maybe install `MongoDB Compass` on Windows for GUI
REM python3 create_database.py %PORT%