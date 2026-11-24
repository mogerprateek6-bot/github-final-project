#!/usr/bin/env bash

# Calculate simple interest: (principal * rate * time) / 100

read -r -p "Enter principal amount: " principal
read -r -p "Enter annual interest rate (%): " rate
read -r -p "Enter time in years: " time

# Validate that all inputs are non-negative numbers.
number_re='^[0-9]+([.][0-9]+)?$'
for value in "$principal" "$rate" "$time"; do
    if [[ ! $value =~ $number_re ]]; then
        echo "Error: please enter non-negative numbers only." >&2
        exit 1
    fi
done

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time"     'BEGIN { printf "%.2f", (p * r * t) / 100 }')

echo "Simple interest: $interest"
