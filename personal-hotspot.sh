#!/bin/bash

# Function to test network connectivity
test_connectivity() {
    echo "Testing network connectivity..."
    ping -c 1 -W 5 "${DNS_SERVER}" >/dev/null 2>&1
    return $?
}

# Check if the script has the correct number of arguments
if [[ $# -lt 2 || $# -gt 4 ]]; then
    echo "Usage: $0 <WiFi Name> <WiFi Password> [Delay in seconds (default: 20)] [DNS Server (default: 8.8.8.8)]"
    exit 1
fi

# Assign command-line arguments to variables
WIFI_NAME="$1"
WIFI_PASSWORD="$2"
DELAY="${3:-20}"  # Use third argument if provided, otherwise default to 20
DNS_SERVER="${4:-8.8.8.8}"  # Use fourth argument if provided, otherwise default to Google DNS

# Test if already connected
if test_connectivity; then
    echo "Already connected to a network"
    exit 0
fi

# Connect to the Wi-Fi network
echo "Attempting to connect to Wi-Fi network: $WIFI_NAME..."
networksetup -setairportnetwork en0 "$WIFI_NAME" "$WIFI_PASSWORD"

# Wait for the connection to be established
echo "Waiting for the connection to be established (${DELAY}s)..."
sleep "$DELAY"

# Test new connection
if test_connectivity; then
    echo "Connected to Wi-Fi network: $WIFI_NAME"
else
    echo "Failed to connect to Wi-Fi network: $WIFI_NAME"
fi
