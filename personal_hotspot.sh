#!/bin/bash

# Function to test network connectivity
test_connectivity() {
    echo "Testing network connectivity..."
    ping -c 1 -W 5 8.8.8.8 >/dev/null 2>&1
    return $?
}

# Check if the script has the correct number of arguments
if [[ $# -ne 2 ]]; then
    echo "Usage: $0 <WiFi Name> <WiFi Password>"
    exit 1
fi

# Assign command-line arguments to variables
WIFI_NAME="$1"
WIFI_PASSWORD="$2"

# Test if already connected
if test_connectivity; then
    echo "Already connected to a network"
    exit 0
fi

# Connect to the Wi-Fi network
echo "Attempting to connect to Wi-Fi network: $WIFI_NAME..."
networksetup -setairportnetwork en0 "$WIFI_NAME" "$WIFI_PASSWORD"

# Wait for the connection to be established
echo "Waiting for the connection to be established..."
sleep 20

# Test new connection
if test_connectivity; then
    echo "Connected to Wi-Fi network: $WIFI_NAME"
else
    echo "Failed to connect to Wi-Fi network: $WIFI_NAME"
fi
