# Personal Hotspot Connector

A bash script that can connect to WiFi networks and personal hotspots on macOS. The script attempts to connect to a specified network and verifies the connection is working properly.

## Installation

1. Clone this repository or download the `personal-hotspot.sh` script
2. Make the script executable:
   ```bash
   chmod +x personal-hotspot.sh
   ```

## Usage

Run the script with the following syntax:

```bash
./personal-hotspot.sh <WiFi Name> <WiFi Password> [Delay in seconds] [DNS Server]
```

### Parameters

- `WiFi Name`: The name (SSID) of the WiFi network to connect to
- `WiFi Password`: The password for the WiFi network
- `Delay` (optional): Time to wait for connection establishment in seconds (default: 20)
- `DNS Server` (optional): DNS server to use for connectivity test (default: 8.8.8.8)

### Examples

Connect to a network with default settings:
```bash
./personal-hotspot.sh "My iPhone" "password123"
```

Connect with custom delay:
```bash
./personal-hotspot.sh "My iPhone" "password123" 30
```

Connect with custom DNS server:
```bash
./personal-hotspot.sh "My iPhone" "password123" 20 1.1.1.1
```

## License

This project is licensed under the terms of the LICENSE file included in the repository.
