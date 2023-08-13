#!/bin/bash

usage() {
    echo "Usage: build.sh [build|run]"
}

get_token() {
    token_name="$1"
    token_line=$(grep "$token_name=" .env)
    token_value=${token_line#$token_name=}
    echo "$token_value"
}

build() {
    cargo build

    echo "Built."
}

run() {

    DISCORD_TOKEN=$(get_token "DISCORD_TOKEN")
    DISCORD_TOKEN=$DISCORD_TOKEN cargo run

    echo $DISCORD_TOKEN

    echo "Ran."
}



if [ $# -eq 0 ]; then
    usage
    exit 1
fi

if [ "$1" = "build" ]; then
    build
elif [ "$1" = "run" ]; then
    run
else
  usage
  exit 1
fi
