#!/bin/bash

# Remove the default route for the VPN
sudo route delete default -interface utun4

# Add a route for the LAN network (assuming it's 10.0.0.0/8) through the VPN
sudo route -n add -net 10.0.0.0/8 -interface utun4

# Add back the default route for your regular internet connection (assuming 10.0.10.1 is your gateway)
sudo route add default 10.0.10.1

# Change the DNS server for VPN Conexion Interface
sudo networksetup -setdnsservers 'INFOTEP-WIND(0024)' 10.132.23.4 10.132.23.5

# Display the updated routing table
netstat -nr

