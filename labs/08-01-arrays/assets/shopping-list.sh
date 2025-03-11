#!/bin/bash

declare -a shopping_list

while read -p "Add items to your list (or type 'save' to stop adding): " input_value; do

  if [[ "${input_value}" == "save" ]]; then
      break
  fi
  echo value is $input_value
  shopping_list+=("${input_value}")

done