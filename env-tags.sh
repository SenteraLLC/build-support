#!/usr/bin/env bash

BRANCH=$(git rev-parse --abbrev-ref HEAD)

if [[ $BRANCH = dev ]] || [[ $BRANCH = dev.* ]]; then
  echo "dev"
elif [[ $BRANCH = staging ]] || [[ $BRANCH = staging.* ]]; then
  echo "staging"
elif [[ $BRANCH = staging2 ]] || [[ $BRANCH = staging2.* ]]; then
  echo "staging2"
elif [[ $BRANCH = master ]] || [[ $BRANCH = main ]]; then
  echo "prod"
fi
