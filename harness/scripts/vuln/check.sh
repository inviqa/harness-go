#!/bin/bash

check() {
  if ! hash govulncheck 2>/dev/null
  then
    echo "It looks like you do not have govulncheck installed. Run 'go install golang.org/x/vuln/cmd/govulncheck@latest' to get it."
    exit 1
  fi

  govulncheck ./...
}

check
