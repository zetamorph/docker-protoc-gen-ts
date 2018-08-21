#!/bin/bash
trap SIGINT SIGTERM
protoc_command="protoc \
    --plugin=\"protoc-gen-ts=/usr/bin/protoc-gen-ts\" \
    --ts_out=\"/opt/generated\" \
    -I /opt/proto/ \
    /opt/proto/*.proto"

eval $protoc_command

while true; do
    inotifywait -e modify,create,delete -r -q /opt/proto && \
    eval $protoc_command
done