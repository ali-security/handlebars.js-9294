#!/bin/bash

set -e

# Cleanup: package-lock and "npm ci" is not working with local dependencies
rm dist package-lock.json -rf
npm config set registry https://time-machines-npm.sealsecurity.io/
npm config set //time-machines-npm.sealsecurity.io/:_authToken=2023-08-01T21:06:18.000000Z
npm install
npm run build

node dist/bundle.js
echo "Success"