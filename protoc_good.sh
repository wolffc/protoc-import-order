#!/bin/bash

PROTO_FILES=$(find "$(pwd)/Company/One" -iname '*.proto')
OUT_DIR=$(mktemp -d)

echo -e "\nGood Import order\n"
protoc -I="$(pwd)" -I="$(pwd)/Company/One" --php_out="${OUT_DIR}" $PROTO_FILES
echo "exit code: $?";

echo -e "\nBad Import order\n"
protoc -I="$(pwd)/Company/One" -I="$(pwd)"  --php_out="${OUT_DIR}" $PROTO_FILES
echo "exit code: $?";
