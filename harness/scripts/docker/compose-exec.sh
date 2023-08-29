#!/usr/bin/env bash

COMPOSE_BIN=($COMPOSE_BIN)

function compose_exec()
{
  local noTtyFlag=""

  if [ ! -t 1 ]; then
    noTtyFlag="-T"
  fi

  "${COMPOSE_BIN[@]}" exec $noTtyFlag app "$@"
}

compose_exec "$@"
