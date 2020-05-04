#!/usr/bin/env bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [[ $BRANCH = "master" ]]; then
  echo "prod,dev"
elif [[ $BRANCH = staging.* ]]; then
  echo "staging,staging2"
fi
