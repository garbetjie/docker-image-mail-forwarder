#!/usr/bin/env bash
set -e

docker push ${REPO_NAME}/mail:latest
docker push ${REPO_NAME}/mail:${COMMIT}
docker push ${REPO_NAME}/mail:debug
docker push ${REPO_NAME}/mail:debug-${COMMIT}
