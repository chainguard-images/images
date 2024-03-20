## Testing

Currently, nfs-server is not deployed on the k8s cluster, but is run from multipass. The instructions to be followed are:

1) Install Multipass
```
brew install multipass
```
2) Create a vm to install nfs in it
```
multipass create --name nfs-server
multipass exec nfs-server -- bash
$sudo apt install nfs-kernel-server
```
3) Create nfs directory to mount and share
```
$sudo mkdir /nfs
$sudo nano /etc/exports
```
add the following line
```
nfs *(rw,sync,no_subtree_check,no_root_squash,no_all_squash,insecure)
```
4) Save the file and export the shares
```
sudo exportfs -ar
exit
```
5) Get IP of multipass node
```
multipass ls
```
6) Substitute the IP and NFS path as variables while calling terraform plan. They currently have default values
