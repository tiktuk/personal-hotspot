#!/bin/bash

# Check if the script has the correct number of arguments
if [[ $# -ne 2 ]]; then
  echo "Usage: $0 <WiFi Name> <WiFi Password>"
  exit 1
fi

# Assign command-line arguments to variables
WIFI_NAME="$1"
WIFI_PASSWORD="$2"

# Connect to the Wi-Fi network
echo "Attempting to connect to Wi-Fi network: $WIFI_NAME..."
networksetup -setairportnetwork en0 "$WIFI_NAME" "$WIFI_PASSWORD"

# Wait for the connection to be established
echo "Waiting for the connection to be established..."
sleep 20

# Debug: Show the raw output of the current network query
RAW_OUTPUT=$(networksetup -getairportnetwork en0)
echo "Raw network output: $RAW_OUTPUT"

# Extract the current network name from the output
CURRENT_NETWORK=$(echo "$RAW_OUTPUT" | awk -F": " '{print $2}')

# Debug: Show what CURRENT_NETWORK contains
echo "Detected network: $CURRENT_NETWORK"

# Check if the connection was successful
if [[ "$CURRENT_NETWORK" == "$WIFI_NAME" ]]; then
  echo "Connected to Wi-Fi network: $WIFI_NAME"
else
  echo "Failed to connect to Wi-Fi network: $WIFI_NAME"
fi
