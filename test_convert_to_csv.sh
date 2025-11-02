#!/bin/bash
# Test for convert_to_csv.sh

expected_output="binary,binary_symbols
101,⊕◯⊕
10,⊕◯
111,⊕⊕⊕"

output=$(./convert_to_csv.sh 5 2 7)

if [ "$output" == "$expected_output" ]; then
  echo "Test passed!"
else
  echo "Test failed!"
  echo "Expected:"
  echo "$expected_output"
  echo "Got:"
  echo "$output"
  exit 1
fi
