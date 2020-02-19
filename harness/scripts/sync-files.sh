#!/usr/bin/env bash

sync()
{
    local skeleton_dir="$1"
    local project_dir="$2"

    if [ ! -f "${project_dir}/go.mod" ]; then
        rsync --exclude='*.twig' --exclude='_twig' -a "$skeleton_dir" "$project_dir"
    fi
}

sync "$1" "$2"
