#!/bin/bash

bench_compare() {
  if ! hash benchstat 2>/dev/null
  then
    echo "It looks like you do not have benchstat installed. Run 'go install golang.org/x/perf/cmd/benchstat@latest' to get it."
    exit 1
  fi

  local current_branch
  current_branch=$(git branch --show-current)

  if [ -n "$(git status --porcelain)" ]
  then
    echo "You have uncommitted changes in your working tree. Please commit or stash them and try running benchmarks again."
    exit 1
  fi

  stable_branch="master"
  read -p "What is your stable branch? (default: master) " -r stable_branch
  if [ "$stable_branch" == "" ]
  then
    stable_branch="master"
  fi

  if ! git rev-parse --verify $stable_branch > /dev/null 2>/dev/null
  then
    echo "The stable branch you have specified ($stable_branch) is not valid. Please check you have spelt it correctly and try again."
    exit 1
  fi

  read -p "To run a benchmark comparison, your environment will be destroyed and rebuilt. Is this ok? [y/n] " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    ws rebuild
    ws go bench report
    git checkout "$stable_branch" && git pull origin "$stable_branch"
    ws rebuild
    ws go bench report
    git checkout "$current_branch"
    benchstat ./benchmarks/reports/"${stable_branch}".txt ./benchmarks/reports/"${current_branch}".txt
  fi
}

bench_compare
