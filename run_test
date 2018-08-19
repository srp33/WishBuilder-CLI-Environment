#! /bin/bash

set -o errexit

scriptName="$1"

if [[ "$scriptName" == "" ]]
then
  echo Please specify a script name.
  exit 1
fi

cd /tmp
bash "$scriptName"
