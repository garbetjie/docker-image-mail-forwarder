#!/usr/bin/env bash
set -e

echo -n '' > /tmp/docker-images-to-cache

for tag in debug latest
do
    image=${REPO_NAME}/mail:${tag}

    docker history -q ${image} | grep -v '<missing>' >> /tmp/docker-images-to-cache

    if [ $? -eq 0 ]; then
        echo ${image} >> /tmp/docker-images-to-cache
    fi
done

docker save $(cat /tmp/docker-images-to-cache) | gzip > ${CACHE_FILE}
