#!/usr/bin/env bash

run docker-compose down --rmi local --volumes --remove-orphans
passthru ws cleanup built-images
run rm -f .my127ws/.flag-built
