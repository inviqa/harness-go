#!/usr/bin/env bash

COMPOSE_BIN=($COMPOSE_BIN)

main()
{
    passthru ws networks external
    if [ ! -f .my127ws/.flag-built ]; then
        passthru "${COMPOSE_BIN[@]}" down

        ws external-images pull
        passthru ws build
        passthru "${COMPOSE_BIN[@]}" up -d

        touch .my127ws/.flag-built
    else
        passthru "${COMPOSE_BIN[@]}" up -d
    fi
}

main
