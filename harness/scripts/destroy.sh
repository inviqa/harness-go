#!/usr/bin/env bash

run docker-compose down --rmi local --volumes --remove-orphans
run rm -f .my127ws/.flag-built
