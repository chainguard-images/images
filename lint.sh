#!/usr/bin/env bash

set -e

for m in `find . -name main.tf | grep ./images/ | cut -d/ -f3 | uniq`; do
  if [ "$m" == "TEMPLATE" ]; then
    continue
  fi
  if ! grep -q "module.*$m" main.tf; then
    echo "module $m is not used"
    exit 1
  fi
done
