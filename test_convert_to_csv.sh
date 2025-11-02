#!/bin/bash
# Test for convert_to_csv.sh

expected_output="binary,binary_symbols
101,⊕◯⊕
10,⊕◯
111,⊕⊕⊕"

output=$(./convert_to_csv.sh 5 2 7)

expected_output_list="number,binary,binary_symbols
5,101,⊕◯⊕
2,10,⊕◯
7,111,⊕⊕⊕"
output_list=$(./convert_to_csv.sh 5 2 7)

expected_output_range="number,binary,binary_symbols
1,1,⊕
2,10,⊕◯
3,11,⊕⊕
4,100,⊕◯◯
5,101,⊕◯⊕"
output_range=$(./convert_to_csv.sh 1-5)

pass=true
if [ "$output_list" != "$expected_output_list" ]; then
  echo "Test failed for list input!"
  echo "Expected:"; echo "$expected_output_list"
  echo "Got:"; echo "$output_list"
  pass=false
fi
if [ "$output_range" != "$expected_output_range" ]; then
  echo "Test failed for range input!"
  echo "Expected:"; echo "$expected_output_range"
  echo "Got:"; echo "$output_range"
  pass=false
fi
if $pass; then
  echo "All tests passed!"
else
  exit 1
fi
