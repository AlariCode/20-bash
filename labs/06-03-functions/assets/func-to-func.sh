#!/bin/bash

worker() {

  indent="$2"
  for (( k = 0; k < $indent; k++ )); do
    echo -n '-'
  done

  echo -n '>'

  threshold=$RANDOM  

  echo "$FUNCNAME-$threshold"
  
  [[ $1 -gt $threshold ]] || return

  indent=$(( indent + 1 ))

  worker $threshold $indent

}

wrapper() {

  threshold=$RANDOM
  echo "$FUNCNAME-$threshold"

  for (( j = 1; j <= $1; j++ )); do
    worker $threshold 0
  done

}


wrapper_calls=$1
worker_calls=$2

for (( i = 1; i <= $wrapper_calls; i++ )); do

  wrapper

done