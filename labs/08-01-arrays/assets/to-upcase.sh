#!/bin/bash

while read -p "Search music by ISRC (enter 'exit' to stop): " record; do
  if [[ "${record}" == "exit" ]]; then
    break
  fi
  echo "${record}"
done
