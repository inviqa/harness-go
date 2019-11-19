#!/usr/bin/env bash

main()
{
    passthru ws networks external
    if [ ! -f .my127ws/.flag-built ]; then
        passthru docker-compose down

        passthru ws build
        passthru docker-compose up -d

        touch .my127ws/.flag-built
    else
        passthru docker-compose up -d
    fi
}

main
