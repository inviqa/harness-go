#!/usr/bin/env bash

function compose_exec()
{
  local noTtyFlag=""

  if [ ! -t 1 ]; then
    noTtyFlag="-T"
  fi

  docker-compose exec $noTtyFlag app "$@"
}

compose_exec "$@"
