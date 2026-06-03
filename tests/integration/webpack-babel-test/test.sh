#!/bin/bash

set -e

# Cleanup: package-lock and "npm ci" is not working with local dependencies
npm config set registry https://time-machines-npm.sealsecurity.io/
npm config set //time-machines-npm.sealsecurity.io/:_authToken=2023-08-01T21:06:18.000000Z

rm dist package-lock.json -rf
npm install --legacy-peer-deps
npm run build

for i in dist/*-test.js ; do
  echo "----------------------"
  echo "-- Running $i"
  echo "----------------------"
  node "$i"
  echo "Success"
done