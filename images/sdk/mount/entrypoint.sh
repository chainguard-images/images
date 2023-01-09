#!/bin/bash -e
printf "\nWelcome to the development environment!\n\n\n"
export PS1="[sdk] ❯ "
export PATH="/root/.cache/go/bin:${PATH}"
export GOPATH="/root/.cache/go"
export CGO_ENABLED=0
bash -i
