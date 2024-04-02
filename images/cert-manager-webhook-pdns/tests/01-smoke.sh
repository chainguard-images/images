#!/usr/bin/env bash

set -o errexit -o nounset -o errtrace -o pipefail -x

PASSWORD=$(echo -n 'admin:admin' | base64)

# https://github.com/PowerDNS-Admin/PowerDNS-Admin/blob/master/docs/API.md
kubectl expose deployment powerdns -n powerdns

# Fixes the following issue:
# Error presenting challenge: pdns.acme.zacharyseguin.ca is forbidden: User "system:serviceaccount:default:cert-manager" cannot create resource "pdns" in API group "acme.zacharyseguin.ca" at the cluster scope
cat <<EOF | kubectl apply -f -
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: cert-manager-pdns
rules:
- apiGroups: ["acme.zacharyseguin.ca"]
  resources: ["pdns"]
  verbs: ["create", "update", "delete", "get", "list", "watch"]
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: cert-manager-pdns
subjects:
- kind: ServiceAccount
  name: cert-manager
  namespace: cert-manager
roleRef:
  kind: ClusterRole
  name: cert-manager-pdns
  apiGroup: rbac.authorization.k8s.io
EOF

# https://github.com/zachomedia/cert-manager-webhook-pdns?tab=readme-ov-file#issuerclusterissuer
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: Secret
metadata:
  name: pdns-api-key
  namespace: ${NAMESPACE}
type: Opaque
data:
  key: ${PASSWORD}
---
apiVersion: cert-manager.io/v1
kind: Issuer
metadata:
  name: letsencrypt-staging
  namespace: ${NAMESPACE}
spec:
  acme:
    email: certificates@example.ca
    server: https://acme-staging-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: letsencrypt-staging-account-key
    solvers:
      - dns01:
          webhook:
            groupName: acme.zacharyseguin.ca
            solverName: pdns
            config:
              host: http://powerdns.powerdns.svc.cluster.local:8081
              apiKeySecretRef:
                name: pdns-api-key
                key: key
              serverID: localhost
EOF

sleep 10

cat <<EOF | kubectl apply -f -
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: test-example-ca
  namespace: ${NAMESPACE}
spec:
  secretName: example-com-tls
  dnsNames:
  - example.ca
  - www.example.ca
  issuerRef:
    name: letsencrypt-staging
    kind: Issuer
    group: cert-manager.io
EOF

# Wait a while until the request get hooked and reconciled. 
sleep 10

kubectl get events -A --sort-by='.lastTimestamp' | tail -n 10
kubectl get secrets -A
kubectl get certificates.cert-manager.io -A
kubectl get challenges.acme.cert-manager.io -A

logs=$(kubectl logs -l app.kubernetes.io/name=cert-manager-webhook-pdns -n ${NAMESPACE})

echo "$logs" | grep -q "\"Presenting challenge\" dnsName=\"example.ca\" resolvedZone=\"ca.\""
echo "$logs" | grep -q "\"Presenting challenge\" dnsName=\"www.example.ca\" resolvedZone=\"ca.\""
