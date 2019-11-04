#!/usr/bin/env bash

go mod tidy -v

if git status --porcelain | grep "go\.mod"
then
  echo "Run go mod tidy to fix your module dependencies."
  exit 1
else
  echo "No unused or missing dependencies found in go.mod."
  exit 0
fi
