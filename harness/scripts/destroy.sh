#!/usr/bin/env bash

run docker-compose down --rmi local --volumes --remove-orphans

if [[ -z "$CONTEXT" ]]; then
  docker buildx rm "${CONTEXT}"
fi

passthru ws cleanup built-images
run rm -f .my127ws/.flag-built
