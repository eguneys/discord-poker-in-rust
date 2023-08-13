#!/bin/bash

usage() {
    echo "Usage: dev.sh [start|stop]"
}

REMOTE=emre@raspberrypi

stop() {

    CMD="sudo systemctl stop dpir"

    ssh $REMOTE $CMD
    echo "Stopped."
}

start() {
    CMD="sudo systemctl start dpir"

    ssh $REMOTE $CMD

    echo "Started."
}

if [ $# -eq 0 ]; then
    usage
    exit 1
fi

if [ "$1" = "start" ]; then
    start
elif [ "$1" = "stop" ]; then
    stop
else
  usage
  exit 1
fi
