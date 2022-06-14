#!/usr/bin/env bash

function integration_run() {
  local noTtyFlag=""

  if [ ! -t 1 ]; then
    noTtyFlag="-T"
  fi

  echo "docker-compose exec $noTtyFlag -e GO_TEST_MODE=docker -e LOG_LEVEL=error app go test -count=1 -v -cover -coverprofile=cp.out -coverpkg ./... --tags=integration ./integration/"
  docker-compose exec $noTtyFlag -e GO_TEST_MODE=docker -e LOG_LEVEL=error app go test -count=1 -v -cover -coverprofile=cp.out -coverpkg ./... --tags=integration ./integration/
}

integration_run "$1"
