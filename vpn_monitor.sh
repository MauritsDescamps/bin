#!/bin/bash

# Function to check VPN connection status
check_vpn_status() {
    networksetup -showpppoestatus "VPN"
}

# Function to reconnect VPN if disconnected
monitor_and_reconnect() {
    while true; do
        vpn_status=$(check_vpn_status)
        
        if [ "$vpn_status" != "connected" ]; then
            echo "VPN disconnected. Attempting to reconnect..."
            vpn  # Call your existing VPN script to connect
        else
            echo "VPN is connected. Monitoring..."
        fi
        
        sleep 10  # Check the status every 10 seconds
    done
}

# Start monitoring and reconnecting if needed
monitor_and_reconnect
