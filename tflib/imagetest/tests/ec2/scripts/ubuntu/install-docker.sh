#!/bin/bash
set -ex
export DEBIAN_FRONTEND=noninteractive

# Configure SSH server keepalive to maintain connections through NAT/firewalls
# This prevents "Broken pipe" errors during long-running Docker operations over SSH
# - TCPKeepAlive: OS-level TCP keepalive probes
# - ClientAliveInterval: SSH application-level keepalive every 30s
# - ClientAliveCountMax: Disconnect after 10 missed responses (5 min timeout)
cat >> /etc/ssh/sshd_config <<EOF
TCPKeepAlive yes
ClientAliveInterval 30
ClientAliveCountMax 10
EOF
systemctl restart ssh

# Install Docker Engine following official docs:
# https://docs.docker.com/engine/install/ubuntu/

# Install prerequisites
apt-get update
apt-get install -y ca-certificates curl

# Add Docker's official GPG key
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository using DEB822 format
tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/ubuntu
Suites: $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}")
Components: stable
Signed-By: /etc/apt/keyrings/docker.asc
EOF

# Install Docker
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add ubuntu user to docker group
usermod -aG docker ubuntu
