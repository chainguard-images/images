echo -e "Sleeping for 60 seconds"
sleep 60

cpu=`kubectl get no -o json | jq '.items[].metadata.labels' | grep 'feature.node.kubernetes.io/cpu-'`
kernel=`kubectl get no -o json | jq '.items[].metadata.labels' | grep 'feature.node.kubernetes.io/kernel-'`
storage=`kubectl get no -o json | jq '.items[].metadata.labels' | grep 'feature.node.kubernetes.io/storage-'`

if [[ ${#cpu} -ge 1 && ${#kernel} -ge 1 && ${#storage} -ge 1 ]]; then
    exit 0
else
    echo "Corresponding CPU or Kernel or storage labels have not been found"
    exit 1
fi