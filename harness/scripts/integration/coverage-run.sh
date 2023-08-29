#!/usr/bin/env bash

COMPOSE_BIN=($COMPOSE_BIN)

function integration_run() {
  local noTtyFlag=""

  if [ ! -t 1 ]; then
    noTtyFlag="-T"
  fi

  echo "${COMPOSE_BIN[@]} exec $noTtyFlag -e GO_TEST_MODE=docker -e LOG_LEVEL=error app go test -count=1 -v -cover -coverprofile=cp.out -coverpkg ./... --tags=integration ./integration/"
  "${COMPOSE_BIN[@]}" exec $noTtyFlag -e GO_TEST_MODE=docker -e LOG_LEVEL=error app go test -count=1 -v -cover -coverprofile=cp.out -coverpkg ./... --tags=integration ./integration/
}

integration_run "$1"
