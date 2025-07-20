#!/bin/bash
export PLATFORM=$1
export CGO_ENABLED=0

rm -R ./build 
mkdir -p ./build 
rm -R ./cmd/main/dist 
mkdir -p ./cmd/main/dist 
rm -R ./frontend/dist 

cd ./frontend
npm run build
cd ..
cp -R ./frontend/dist ./cmd/main
cd ./cmd/main

GIT_TAG=$(git describe --tags --abbrev=0)
if [[ "windows" == "$PLATFORM" ]];then
GOOS=$PLATFORM go build -ldflags "-s -w -X github.com/tunnels-is/tunnels/client.Version=$GIT_TAG" -o Tunnels-$PLATFORM.exe .
else
go build -ldflags "-s -w -X github.com/tunnels-is/tunnels/client.Version=$GIT_TAG" -o Tunnels-$PLATFORM .
fi

mv Tunnels-* ../../build/

cd ../..

if [[ "linux" == "$PLATFORM" ]];then
chmod +x ./build/*
fi
