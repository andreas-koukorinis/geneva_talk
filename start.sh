#!/usr/bin/env bash

port=$1
echo "http://localhost:$port/tree"

port+=":9999"
docker run -d -p $port talk


