#!/bin/sh

if [ -d "dist" ]; then
    rm -rf dist
fi

mkdir -p dist

go mod tidy

CGO_ENABLED="0" go build -ldflags="-s -w" -a -o TechChallengeApp .

pushd ui
rice append --exec TechChallengeApp
popd

mv TechChallengeApp dist/
cp conf.toml dist/
