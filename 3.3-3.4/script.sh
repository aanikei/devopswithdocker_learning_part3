#!/bin/sh

echo "Cloning from: $1"

git clone https://github.com/$1

FOLDER=$(echo "$1" | sed -n 's#.*/\([^/]*\)$#\1#p')

echo "Folder: $FOLDER"

cd $FOLDER

#USERNAME=$(echo "$2" | grep -oP '^[^/]+')

docker login -u $DOCKER_USER -p $DOCKER_PWD

echo "Building image: test"

docker build . -t test

echo "Publishing to Docker Hub: $2"

docker tag test $2

docker push $2

