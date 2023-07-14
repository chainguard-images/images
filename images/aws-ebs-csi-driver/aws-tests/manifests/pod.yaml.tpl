
apiVersion: v1
kind: Pod
metadata:
  name: ${pod_name}
spec:
  restartPolicy: Never
  containers:
  - name: write
    image: cgr.dev/chainguard/busybox
    args: ["-c", "echo $(date -u) >> /data/out.txt; echo wrote"]
    volumeMounts:
    - name: ebs
      mountPath: /data
  volumes:
  - name: ebs
    persistentVolumeClaim:
      claimName: ${pvc_name}
