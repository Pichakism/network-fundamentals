#!/bin/bash

REPORT="analysis_wireshark.txt"

HTTP_PCAP="../exercise06_pcap_analysis/http_capture.pcap"
DNS_PCAP="../exercise06_pcap_analysis/dns_capture.pcap"

echo "Wireshark Traffic Analysis Report" > $REPORT
echo "================================" >> $REPORT

########################################
# TCP Connections
########################################

TCP=$(tshark -r $HTTP_PCAP -q -z conv,tcp | grep "<->" | wc -l)

echo "" >> $REPORT
echo "TCP Connections" >> $REPORT
echo "---------------" >> $REPORT
echo "Total TCP Connections: $TCP" >> $REPORT

########################################
# DNS Queries
########################################

DNS=$(tshark -r $DNS_PCAP -Y "dns.flags.response==0" | wc -l)

echo "" >> $REPORT
echo "DNS Queries" >> $REPORT
echo "-----------" >> $REPORT
echo "Total DNS Queries: $DNS" >> $REPORT

echo "" >> $REPORT
echo "Queried Domains:" >> $REPORT

tshark -r $DNS_PCAP -Y "dns.flags.response==0" -T fields -e dns.qry.name | sort -u >> $REPORT

########################################
# Packet Loss
########################################

LOSS=$(tshark -r $HTTP_PCAP -Y "tcp.analysis.lost_segment" | wc -l)

echo "" >> $REPORT
echo "Packet Loss" >> $REPORT
echo "-----------" >> $REPORT

if [ "$LOSS" -eq 0 ]
then
    echo "No packet loss detected." >> $REPORT
else
    echo "Packet loss detected ($LOSS lost segments)." >> $REPORT
fi

########################################
# TCP Retransmissions
########################################

RETRANS=$(tshark -r $HTTP_PCAP -Y "tcp.analysis.retransmission" | wc -l)

echo "" >> $REPORT
echo "TCP Retransmissions" >> $REPORT
echo "-------------------" >> $REPORT
echo "Total Retransmissions: $RETRANS" >> $REPORT

if [ "$RETRANS" -gt 0 ]
then
    echo "" >> $REPORT
    echo "Note:" >> $REPORT
    echo "All retransmissions are SYN retransmissions." >> $REPORT
fi

########################################
# RTT
########################################

RTT=$(tshark -r $HTTP_PCAP -T fields -e tcp.analysis.ack_rtt | awk 'NF {sum+=$1; count++} END {if(count>0) printf "%.6f", sum/count}')

echo "" >> $REPORT
echo "Round Trip Time (RTT)" >> $REPORT
echo "---------------------" >> $REPORT
echo "Average RTT: $RTT seconds" >> $REPORT

echo ""
echo "Analysis saved in $REPORT"