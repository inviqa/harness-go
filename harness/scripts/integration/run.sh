#!/usr/bin/env bash

COMPOSE_BIN=($COMPOSE_BIN)

function integration_run() {
  local noTtyFlag=""
  local testFlag=""

  if [ "" != "$1" ]; then
    testFlag="-run $1"
  fi

  if [ ! -t 1 ]; then
    noTtyFlag="-T"
  fi

  echo "${COMPOSE_BIN[@]} exec $noTtyFlag -e GO_TEST_MODE=docker -e LOG_LEVEL=error app go test -count=1 -v --tags=integration ./integration/ $testFlag"
  "${COMPOSE_BIN[@]}" exec $noTtyFlag -e GO_TEST_MODE=docker -e LOG_LEVEL=error app go test -count=1 -v --tags=integration ./integration/ $testFlag
}

integration_run "$1"
