#!/bin/bash

# Check variables
if [[ -z "${LITER}" || -z "${FLOOR}" ]]; then
    >&2 echo "ENVs not set";
    exit 1;
fi

input_file="${1}"

if [[ ! -f "${input_file}" ]]; then
    >&2 echo "No DB file";
    exit 1;
fi

# Fix data representation
column=$((LITER+1))
row=$((FLOOR+1))

echo "Checking for floor #${FLOOR} and liter ${LITER}" 

# Your awk code below

