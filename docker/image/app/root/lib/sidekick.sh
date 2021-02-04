#!/bin/bash

VERBOSE="no"

RUN_CWD=""

INDICATOR_RUNNING="34m"
INDICATOR_SUCCESS="32m"
INDICATOR_ERROR="31m"
INDICATOR_PASSTHRU="37m"

TASKS="/lib/task"

task()
{
    local TASK_FILE="${TASKS}/${1//:/\/}.sh"
    local TASK_NAME="task_${1//:/_}"

    # shellcheck source=/dev/null
    declare -F "${TASK_NAME}" &>/dev/null || source "${TASK_FILE}"

    shift

    "${TASK_NAME}" "$@"
}

prompt()
{
    if [ "${RUN_CWD}" != "$(pwd)" ]; then
        RUN_CWD="$(pwd)"
        echo -e "\\033[1m[\\033[0mdocker(console):$(pwd)\\033[1m]:\\033[0m" >&2
    fi
}

run()
{
    local COMMAND=("$@")

    if [ "$VERBOSE" = "no" ]; then

        prompt
        echo "  >$(printf ' %q' "${COMMAND[@]}")" >&2

        setCommandIndicator "${INDICATOR_RUNNING}"

        if "${COMMAND[@]}" > /tmp/my127ws-stdout.txt 2> /tmp/my127ws-stderr.txt; then
            setCommandIndicator "${INDICATOR_SUCCESS}"
        else
            setCommandIndicator "${INDICATOR_ERROR}"

            echo "Command failed. stdout:"
            cat /tmp/my127ws-stdout.txt
            echo
            echo "stderr:"
            cat /tmp/my127ws-stderr.txt
            echo

            return 1
        fi
    else
        passthru "${COMMAND[@]}"
    fi
}

passthru()
{
    local -r COMMAND=("$@")

    prompt

    echo -e "\\033[${INDICATOR_PASSTHRU}■\\033[0m >$(printf ' %q' "${COMMAND[@]}")" >&2
    "${COMMAND[@]}"
}

setCommandIndicator()
{
    echo -ne "\\033[1A" >&2
    echo -ne "\\033[$1" >&2
    echo -n "■" >&2
    echo -ne "\\033[0m" >&2
    echo -ne "\\033[1E" >&2
}
