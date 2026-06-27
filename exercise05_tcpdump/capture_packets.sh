#!/bin/bash

INTERFACE="ens33"

echo "Capturing HTTP and DNS packets for 30 seconds..."

sudo timeout 30 tcpdump -i $INTERFACE port 80 -w http_capture.pcap &
HTTP_PID=$!

sudo timeout 30 tcpdump -i $INTERFACE port 53 -w dns_capture.pcap &
DNS_PID=$!

wait $HTTP_PID
wait $DNS_PID

echo "Capture completed."