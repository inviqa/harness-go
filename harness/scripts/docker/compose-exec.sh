#!/usr/bin/env bash

function compose_exec()
{
  local noTtyFlag=""

  tty -s;
  if [ "0" != "$?" ]; then
    noTtyFlag="-T"
  fi

  docker-compose exec $noTtyFlag app "$@"
}

compose_exec "$@"
