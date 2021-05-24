#!/bin/bash

bench_report() {
  mkdir -p "./benchmarks/reports/"

  local file
  file="$(git branch --show-current).txt"
  go test -bench=. --tags=benchmarks ./... > ./benchmarks/reports/"${file}"
}

bench_report
