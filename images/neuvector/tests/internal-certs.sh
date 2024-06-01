#!/usr/bin/env bash

# Install openssl
apk add openssl openssl-config

# Generate CA
openssl genrsa -out ca.key 20485
openssl req -x509 -sha256 -new -nodes -key ca.key -days 3650 -out ca.crt -subj "/CN=neuvector-ca"

# Generate cert
openssl genrsa -out tls.key 2048
openssl req -new -key tls.key -sha256 -out cert.csr -config ca.cfg -subj "/CN=neuvector-cert"

# Generate TLS cert
openssl req -in cert.csr -noout -text
openssl x509 -req -sha256 -in cert.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out tls.crt -days 3650 -extfile ca.cfg -subj "/CN=neuvector-tls"
openssl x509 -in tls.crt -text

# Create secret
kubectl create secret generic internal-cert -n neuvector --from-file=tls.key --from-file=tls.crt --from-file=ca.crt
