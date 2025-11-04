#!/bin/bash
# test_BIP39_list_generator.sh
# Basic test for BIP39_list_generator.sh

set -e

EXPECTED_FIRST="0 abandon 00000000000 ◯◯◯◯◯◯◯◯◯◯◯"
EXPECTED_SECOND="1 ability 00000000001 ◯◯◯◯◯◯◯◯◯◯⊕"

OUTPUT=$(bash ./BIP39_list_generator.sh | head -2)

FIRST=$(echo "$OUTPUT" | sed -n '1p')
SECOND=$(echo "$OUTPUT" | sed -n '2p')

if [[ "$FIRST" != "$EXPECTED_FIRST" ]]; then
    echo "Test failed: First line mismatch"
    echo "Expected: $EXPECTED_FIRST"
    echo "Got:      $FIRST"
    exit 1
fi

if [[ "$SECOND" != "$EXPECTED_SECOND" ]]; then
    echo "Test failed: Second line mismatch"
    echo "Expected: $EXPECTED_SECOND"
    echo "Got:      $SECOND"
    exit 1
fi

echo "All tests passed!"
