#!/bin/bash

bench_report() {
  mkdir -p "./benchmarks/reports/"

  local file
  file="$(git branch --show-current).txt"
  go test -count=5 -bench=. --tags=benchmarks -benchmem ./benchmarks/ > ./benchmarks/reports/"${file}"
}

bench_report
