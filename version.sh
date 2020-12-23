#!/usr/bin/env bash

BASEDIR=$(git rev-parse --show-toplevel)
BRANCH=$(git rev-parse --abbrev-ref HEAD)
SHA=$(git rev-parse --short HEAD)
DATE=$(date --rfc-3339=date)

if [[ $BRANCH = "master" ]] || [[ $BRANCH = "main" ]]; then
  if [[ -e ".version" ]]; then
    echo "v$(cat ${BASEDIR}/.version)"
  else
    echo "${DATE}.${SHA}"
  fi
else
  echo "${BRANCH}/${SHA}"
fi
