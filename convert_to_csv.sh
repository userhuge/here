#!/bin/bash
# Usage: ./convert_to_csv.sh 5 2 7

convert() {
  num="$1"
  # Convert to binary
  bin=$(echo "obase=2;$num" | bc)
  # Replace 0 with ◯ and 1 with ⊕
  bin_sym=$(echo "$bin" | sed 's/0/◯/g; s/1/⊕/g')
  echo "$bin,$bin_sym"
}

# Print CSV header
echo "binary,binary_symbols"
for n in "$@"; do
  convert "$n"
done
