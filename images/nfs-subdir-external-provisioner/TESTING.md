## Testing

Currently, nfs-server is not deployed on the k8s cluster, but is run from multipass. The instructions to be followed are:

1) Install Multipass
```shell
brew install multipass
```
2) Create a vm to install nfs in it
```shell
multipass create --name nfs-server
multipass exec nfs-server -- bash
$sudo apt install nfs-kernel-server
```
3) Create nfs directory to mount and share
```shell
$sudo mkdir /nfs
$sudo nano /etc/exports
```
add the following line
``` shell
nfs *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)
```
4) Save the file, export the shares and restart the nfs server
``` shell
sudo exportfs -ar
sudo systemctl restart nfs-server
exit
```
5) Get IP of multipass node
``` shell
multipass ls
```

## Create a local cluster with kind

Using kind you can create your local cluster

```shell
kind create cluster
```

## Pulling the image locally
```shell
docker pull cgr.dev/chainguard/nfs-subdir-external-provisioner:latest
```

## Runing the helm chart

```shell
helm repo add nfs-subdir-external-provisioner https://kubernetes-sigs.github.io/nfs-subdir-external-provisioner/

helm install nfs-subdir-external-provisioner nfs-subdir-external-provisioner/nfs-subdir-external-provisioner \
    --set image.repository=cgr.dev/chainguard/nfs-subdir-external-provisioner \
    --set image.tag=latest \
    --set nfs.server=x.x.x.x \
    --set nfs.path=/exported/path
```

Expected logs will include: 
  "successfully acquired lease"
  "Starting provisioner controller"
  "Started provisioner controller"
