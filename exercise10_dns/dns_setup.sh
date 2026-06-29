#!/bin/bash

REPORT="dns_config.txt"

echo "Configuring /etc/hosts..."

# Add app.local if it does not exist
if ! grep -q "app.local" /etc/hosts
then
    echo "192.168.64.10 app.local" | sudo tee -a /etc/hosts > /dev/null
fi

# Add db.local if it does not exist
if ! grep -q "db.local" /etc/hosts
then
    echo "192.168.64.20 db.local" | sudo tee -a /etc/hosts > /dev/null
fi

echo "Configuring DNS server..."

sudo resolvectl dns ens33 1.1.1.1

echo "Creating report..."

echo "========================" >> $REPORT
echo "DNS CONFIGURATION REPORT" > $REPORT
echo "========================" >> $REPORT

echo "" >> $REPORT
echo "Hosts File:" >> $REPORT
cat /etc/hosts >> $REPORT

echo "" >> $REPORT
echo "DNS Server Status:" >> $REPORT
resolvectl status | grep -E "Current DNS Server|DNS Servers|DNS Domain" >> $REPORT

echo "" >> $REPORT
echo "Ping Test:" >> $REPORT
ping -c 2 app.local >> $REPORT 2>&1

echo "" >> $REPORT
echo "DNS Lookup Test:" >> $REPORT
nslookup google.com >> $REPORT 2>&1

echo ""
echo "Configuration completed."
echo "Report saved to $REPORT"