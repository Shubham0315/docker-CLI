#!/usr/bin/env bash

start() {
  echo "Application starting"
}

process() {
  _process() {
    echo "Application processing ($1/5)"
  }

  for i in $(seq 1 5)
  do _process "$i"
  done
}

finish() {
  echo "Application finished!"
}

start &&
  process &&
  finish
           
