apiVersion: v1
kind: ServiceAccount
metadata:
  name: default
  namespace: default
  annotations:
    iam.gke.io/gcp-service-account: ${sa_email}
