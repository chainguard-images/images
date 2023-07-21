apiVersion: v1
kind: Pod
metadata:
  name: test-pod-${random_id}
spec:
  containers:
    - name: container
      image: cgr.dev/chainguard/busybox
      command: ["cat", "/var/secrets/secret.txt"]
      restartPolicy: Never
      volumeMounts:
        - mountPath: "/var/secrets"
          name: secret
  volumes:
  - name: secret
    csi:
      driver: secrets-store.csi.k8s.io
      readOnly: true
      volumeAttributes:
        secretProviderClass: gcp-secrets
