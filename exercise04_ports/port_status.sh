#!/bin/bash

REPORT="status_port"

echo "===================" > $REPORT
echo "PORT STATUS REPORT" >> $REPORT
echo "===================" >> $REPORT

echo "" >> $REPORT
echo "===== LISTEN PORTS =====" >> $REPORT
netstat -tln >> $REPORT

echo "" >> $REPORT
echo "===== ESTABLISHED CONNECTIONS =====" >> $REPORT
netstat -tan | grep ESTABLISHED >> $REPORT

echo "" >> $REPORT
echo "===== PROCESS ON PORT 80 =====" >> $REPORT
sudo netstat -tulpn | grep ":80 " >> $REPORT

echo "" >> $REPORT
echo "===== PROCESS ON PORT 443 =====" >> $REPORT
sudo netstat -tulpn | grep ":443 " >> $REPORT