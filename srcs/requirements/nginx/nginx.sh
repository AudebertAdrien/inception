#!/bin/bash

IMAGE_NAME="nginx_img"
CONTAINER_NAME="nginx_cnt"
IMAGE_NAME="nginx_img"

OLD_CONTAINER_ID=$(docker ps -aq --filter "name=$CONTAINER_NAME")
OLD_IMAGE_ID=$(docker images -q "$IMAGE_NAME")


if [ -n "$OLD_CONTAINER_ID" ]; then
    docker stop "$OLD_CONTAINER_ID" || true
    docker rm "$OLD_CONTAINER_ID" || true
fi

if [ -n "$OLD_IMAGE_ID" ]; then
    docker rmi -f "$OLD_IMAGE_ID" > /dev/null
fi

docker build -t "$IMAGE_NAME" .

docker run -it --name "$CONTAINER_NAME" -p 8443:443 "$IMAGE_NAME"
