#!/bin/bash

REPORT="analysis_routing"

echo "=======================" >> $REPORT
echo "ROUTING ANALYSIS REPORT" > $REPORT
echo "=======================" >> $REPORT

echo "" >> $REPORT
echo "Routing Table:" >> $REPORT

ip route >> $REPORT

echo "" >> $REPORT
echo "Traceroute to 8.8.8.8:" >> $REPORT

sudo traceroute -I 8.8.8.8 >> $REPORT

echo "" >> $REPORT
echo "Router Explanation:" >> $REPORT

echo "A router forwards packets between networks and selects the best route to a destination." >> $REPORT
