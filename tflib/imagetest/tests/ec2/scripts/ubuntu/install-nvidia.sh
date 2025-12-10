#!/bin/bash
set -ex
export DEBIAN_FRONTEND=noninteractive

# Install NVIDIA driver using ubuntu-drivers (auto-detects GPU and installs correct driver)
# Note: 'autoinstall' is deprecated, use 'install' instead
apt-get install -y ubuntu-drivers-common
ubuntu-drivers install

# Install nvidia-container-toolkit from NVIDIA repository
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey |
  gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list |
  sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' |
  tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
apt-get update
apt-get install -y nvidia-container-toolkit

# Configure Docker to use nvidia runtime
nvidia-ctk runtime configure --runtime=docker
systemctl restart docker
