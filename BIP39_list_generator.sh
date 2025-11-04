#!/bin/bash
# BIP39_list_generator.sh
# Usage: ./BIP39_list_generator.sh > output.txt

WORDLIST="BIP39-english-wordlist.txt"

# Function to convert binary to symbols
bin_to_symbols() {
    local bin="$1"
    local symbols=""
    for (( i=0; i<${#bin}; i++ )); do
        if [[ "${bin:$i:1}" == "1" ]]; then
            symbols+="⊕"
        else
            symbols+="◯"
        fi
    done
    echo "$symbols"
}

awk '{ printf "%d %s\n", NR-1, $1 }' "$WORDLIST" | while read -r number word; do
    bin=$(printf "%011d" "$(echo "obase=2;$number" | bc)")
    symbols=$(bin_to_symbols "$bin")
    printf "%s %s %s %s\n" "$number" "$word" "$bin" "$symbols"
done
