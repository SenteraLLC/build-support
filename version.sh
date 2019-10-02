#!/usr/bin/env bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)
SHA=$(git rev-parse --short HEAD)
DATE=$(date --rfc-3339=date)

if [[ $BRANCH = "master" ]]; then
  if [[ -e ".version" ]]; then
    echo $(cat .version)
  else 
    echo "${DATE}.${SHA}"
  fi
else
  echo "${BRANCH}/${SHA}"
fi
