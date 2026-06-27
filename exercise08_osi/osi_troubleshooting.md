# OSI Model and Network Troubleshooting

## Introduction

The **OSI (Open Systems Interconnection)** model is a conceptual framework that divides network communication into seven layers. Each layer has a specific responsibility and helps identify network problems more easily.

During troubleshooting, network administrators usually start checking from the **Physical Layer (Layer 1)** and continue step by step up to the **Application Layer (Layer 7)**.

---

# Layer 1 – Physical Layer

## Purpose

The Physical Layer is responsible for transmitting bits through cables, network adapters, switches, and other physical devices.

### What to Check

* Is the network cable connected properly?
* Is the network interface enabled?
* Are the link LEDs on?
* Is Wi-Fi connected?

### Linux Commands

```bash
ip link
ethtool ens33
```

---

# Layer 2 – Data Link Layer

## Purpose

The Data Link Layer is responsible for MAC addresses and communication inside the local network.

### What to Check

* Is the network interface up?
* Is the correct MAC address assigned?
* Is the switch working correctly?
* Are ARP entries available?

### Linux Commands

```bash
ip neigh
arp -a
ip link
```

---

# Layer 3 – Network Layer

## Purpose

The Network Layer manages IP addresses and routing between networks.

### What to Check

* Is the IP address configured correctly?
* Is the default gateway correct?
* Is the routing table valid?

### Linux Commands

```bash
ip addr
ip route
ping 8.8.8.8
```

---

# Layer 4 – Transport Layer

## Purpose

The Transport Layer provides TCP and UDP communication.

### What to Check

* Is the required port open?
* Is the service listening?
* Is the firewall blocking traffic?

### Linux Commands

```bash
ss -tuln
netstat -tuln
nc -zv google.com 80
```

---

# Layer 5 – Session Layer

## Purpose

The Session Layer establishes, maintains, and terminates communication sessions.

### What to Check

* Is the connection interrupted?
* Can a session be established successfully?

### Linux Commands

```bash
ssh user@host
telnet google.com 80
```

---

# Layer 6 – Presentation Layer

## Purpose

The Presentation Layer is responsible for data formatting, encryption, and compression.

### What to Check

* Is SSL/TLS working correctly?
* Are certificates valid?
* Is the data format supported?

### Linux Commands

```bash
openssl s_client -connect google.com:443
```

---

# Layer 7 – Application Layer

## Purpose

The Application Layer provides network services directly to users and applications.

### What to Check

* Is the website available?
* Is DNS working correctly?
* Is the application server running?

### Linux Commands

```bash
curl https://google.com
nslookup google.com
dig google.com
```

---

# Troubleshooting Scenario

## Problem

**The user cannot access a website.**

### Step 1 – Check Physical Layer

Verify the network cable or Wi-Fi connection.

### Step 2 – Check Data Link Layer

Verify that the network interface is enabled and ARP entries are correct.

### Step 3 – Check Network Layer

Verify the IP address, default gateway, and test network connectivity.

```bash
ping 8.8.8.8
```

### Step 4 – Check Transport Layer

Verify that the destination port is reachable.

```bash
nc -zv google.com 80
```

### Step 5 – Check Session Layer

Verify that a communication session can be established.

```bash
telnet google.com 80
```

### Step 6 – Check Presentation Layer

Verify SSL/TLS configuration and certificates.

```bash
openssl s_client -connect google.com:443
```

### Step 7 – Check Application Layer

Verify DNS resolution and website availability.

```bash
nslookup google.com
curl https://google.com
```

---

# Conclusion

The OSI model provides a systematic approach to network troubleshooting. By checking each layer from **Layer 1** to **Layer 7**, administrators can quickly identify the source of network problems and apply the appropriate solution.
