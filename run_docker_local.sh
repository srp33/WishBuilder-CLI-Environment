#! /bin/bash

scriptName="$1"

docker run -i --rm \
  -v $(pwd):/tmp \
  srp33/wishbuilder-cli-environment /run_test.sh "$scriptName"
