# TCP vs UDP Analysis

## Introduction

**TCP (Transmission Control Protocol)** and **UDP (User Datagram Protocol)** are the two main transport layer protocols. They differ in reliability, speed, and communication method, making each one suitable for different types of network applications.

---

# TCP

## Characteristics

* Reliable data transmission
* Connection-oriented communication
* Supports retransmission of lost packets
* Delivers packets in the correct order
* Higher overhead due to error checking and acknowledgments

---

# UDP

## Characteristics

* Fast data transmission
* Connectionless communication
* No retransmission of lost packets
* No guarantee of packet order
* Low overhead and low latency

---

# Service and Protocol Mapping

| Service                   | Preferred Protocol | Reason                                                                            |
| ------------------------- | ------------------ | --------------------------------------------------------------------------------- |
| Video Streaming           | **UDP**            | Prioritizes speed over reliability, making it suitable for real-time media.       |
| File Transfer (FTP)       | **TCP**            | Requires reliable and complete file delivery.                                     |
| DNS Query                 | **UDP**            | Queries are small and benefit from low latency.                                   |
| Web Browsing (HTTP/HTTPS) | **TCP**            | Ensures reliable delivery of web content.                                         |
| VoIP Call                 | **UDP**            | Real-time voice communication is more important than retransmitting lost packets. |
| Database Query            | **TCP**            | Requires accurate and reliable data transmission.                                 |

---

# Current Protocol Usage

The following command displays active TCP and UDP connections and listening ports on the system.

## Linux Command

```bash
netstat -tulpn
```

## Example Results

### TCP Ports

```text
22
80
443
```

### UDP Ports

```text
53
```

---

# Conclusion

TCP is the preferred protocol when **reliability and data integrity** are required, while UDP is better suited for applications that require **high speed and low latency**. The choice between TCP and UDP depends on the requirements of the application.
