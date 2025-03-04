#!/bin/bash

PROTO_FILES=$(find "$(pwd)/Company/One" -iname '*.proto')
OUT_DIR=$(mktemp -d)

echo -e "\nImport order in spiral/roadrunner v3.6.1\n"
protoc -I="$(pwd)" -I="$(pwd)/Company/One" --php_out="${OUT_DIR}" $PROTO_FILES
echo "exit code: $?";

echo -e "\nImport order in spiral/roadrunner v3.6.2 and above\n"
protoc -I="$(pwd)/Company/One" -I="$(pwd)"  --php_out="${OUT_DIR}" $PROTO_FILES
echo "exit code: $?";
