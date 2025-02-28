#!/bin/bash

check_vpn_status() {
    networksetup -showpppoestatus "VPN"
}

monitor_and_reconnect() {
    while true; do
        vpn_status=$(check_vpn_status)
        
        if [ "$vpn_status" != "connected" ]; then
            echo "VPN disconnected. Attempting to reconnect..."
            vpn  # Call existing VPN script to connect
        else
            echo "VPN is connected. Monitoring..."
        fi
        
        sleep 10
    done
}

monitor_and_reconnect
