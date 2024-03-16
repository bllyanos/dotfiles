#!/bin/bash

# Get swap usage in percentage
SWAP=$(free -m | awk '/Swap/ {print $3 / $2 * 100}' 2>/tmp/swap_error.log)

# Print the swap usage
echo "Swap: $SWAP%"
