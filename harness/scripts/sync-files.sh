#!/usr/bin/env bash

sync()
{
    local skeleton_dir="$1"
    local project_dir="$2"

    echo "ls on $project_dir:"
    ls "$project_dir"

    if [ ! -f "${project_dir}/go.mod" ]; then
        rsync --exclude='*.twig' --exclude='_twig' -a "$skeleton_dir" "$project_dir"
    fi

    echo "ls on $project_dir:"
    ls "$project_dir"
}

sync "$1" "$2"
