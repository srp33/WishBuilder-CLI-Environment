#! /bin/bash

set -o errexit

tmpDir=/tmp/wishbuilder-cli-environment-docker-build

mkdir -p $tmpDir
rm -rf $tmpDir/*

cp -v Dockerfile $tmpDir/
cp -v run_test.sh $tmpDir/

cd $tmpDir
docker build -t srp33/wishbuilder-cli-environment .
##docker login -u=srp33
#docker push srp33/wishbuilder-cli

cd -
rm -rf $tmpDir
