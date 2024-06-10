#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

# Install openssl
apk add openssl openssl-config

# Generate CA key and certificate
openssl genrsa -out ca.key 2048
openssl req -x509 -sha256 -new -nodes -key ca.key -days 3650 -out ca.crt -subj "/CN=localhost"

# Generate TLS key
openssl genrsa -out tls.key 2048

# Generate certificate signing request (CSR) using SANs
openssl req -new -key tls.key -sha256 -out cert.csr -config san.cnf -batch

# Display the CSR to verify SANs
openssl req -in cert.csr -noout -text

# Generate the TLS certificate using the CA and the CSR, and include SANs
openssl x509 -req -sha256 -in cert.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out tls.crt -days 3650 -extensions v3_req -extfile san.cnf

# Display the generated TLS certificate
openssl x509 -in tls.crt -text

# Create secret
kubectl create ns neuvector
kubectl create secret generic internal-cert -n neuvector  --from-file=tls.key --from-file=tls.crt --from-file=ca.crt
