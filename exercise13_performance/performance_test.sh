#!/bin/bash

REPORT="performance_report.txt"

echo "==========================" >> $REPORT
echo "NETWORK PERFORMANCE REPORT" > $REPORT
echo "==========================" >> $REPORT

echo "Starting iperf3 server..."
iperf3 -s -D

sleep 2

echo "" >> $REPORT
echo "===== Bandwidth Test (TCP) =====" >> $REPORT
iperf3 -c localhost >> $REPORT

echo "" >> $REPORT
echo "===== Jitter and Packet Loss Test (UDP) =====" >> $REPORT
iperf3 -c localhost -u >> $REPORT

echo "" >> $REPORT
echo "===== Latency Test (Ping) =====" >> $REPORT
ping -c 10 8.8.8.8 >> $REPORT

pkill iperf3

echo ""
echo "Report saved to $REPORT"