#!/bin/bash
set -e

[ -z "$1" ] && echo "Usage: $0 <image_name>" && exit 1

IMAGE_NAME=$1
CONTAINERS=$(docker ps -aq --filter ancestor=$IMAGE_NAME)

if [ -n "$CONTAINERS" ]; then
    echo "Stopping and removing containers for image: $IMAGE_NAME"
    docker rm -f $CONTAINERS
else
    echo "No containers found for image: $IMAGE_NAME"
fi