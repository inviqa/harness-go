#!/bin/bash

integration_run() {
  local noTtyFlag=""
  local testFlag=""

  if [ "" != "$1" ]; then
    testFlag="-run $1"
  fi

  tty -s;
  if [ "0" != "$?" ]; then
    noTtyFlag="-T"
  fi

  docker-compose exec $noTtyFlag -e GO_TEST_MODE=docker -e LOG_LEVEL=error app go test -count=1 -v --tags=integration ./integration/ $testFlag
}

integration_run "$1"
