#!/bin/bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)
SHA=$(git rev-parse --short HEAD)

if [[ $BRANCH = "master" ]]; then
  echo $(cat .version)
else
  echo "${BRANCH}/${SHA}"
fi
