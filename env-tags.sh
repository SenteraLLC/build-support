#!/usr/bin/env bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [[ $BRANCH = "master" ]]; then
  echo "prod"
  echo "dev"
  echo ""
elif [[ $BRANCH = staging.* ]]; then
  echo "staging"
  echo "staging2"
fi
