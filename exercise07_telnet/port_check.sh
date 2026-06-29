#!/bin/bash

REPORT="port_report.txt"

{
echo "=========="
echo "HTTP TEST"
echo "=========="
timeout 5 telnet google.com 80

echo ""
echo "========="
echo "SSH TEST"
echo "========="
timeout 5 telnet github.com 22\

echo ""
echo "==========="
echo "MYSQL TEST"
echo "==========="
timeout 5 telnet 127.0.0.1 3306

} &> $REPORT