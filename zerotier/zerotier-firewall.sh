#!/bin/sh
# Set zerotier firewall

echo '1' > /proc/sys/net/ipv4/ip_forward
iptables -I FORWARD -i ztyouuuyfd -j ACCEPT
iptables -I FORWARD -o ztyouuuyfd -j ACCEPT
iptables -t nat -I POSTROUTING -o ztyouuuyfd -j MASQUERADE
