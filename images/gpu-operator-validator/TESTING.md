# Notes on how this image was tested


The `gpu-operator` image required GPUs to test, therefore it is not currently covered by automated tests.


This document describes the manual steps taken to test the image on GCP.


Note, for testing we use a `nvidia/gpu-operator` helm chart which requires bash so you will want to use the `latest-dev` variant.


```
cgr.dev/chainguard-private/gpu-operator:latest-dev
```


If users do not use the helm chart they can use the default image


```
cgr.dev/chainguard-private/gpu-operator:latest
```




Create a n1-standard-4 VM with ubuntu 22 LTS, T4 GPU (others should work), and 200GB disk.


Setup script:


```
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg apt-transport-https wget
sudo install -m 0755 -d /etc/apt/keyrings


# Set up Docker & NVIDIA - keyrings and repository (details at https://collabnix.com/introducing-new-docker-cli-api-support-for-nvidia-gpus-under-docker-engine-19-03-0-beta-release/)
lspci -vv | grep -i nvidia
sudo apt-get install ubuntu-drivers-common && sudo ubuntu-drivers autoinstall
sudo reboot
vim nvidia-container-runtime-script.sh
sh nvidia-container-runtime-script.sh
sudo apt-get install nvidia-container-runtime
docker run --help | grep -i gpus
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
 "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
 "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
 sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# Set up Helm keyring and repository
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list


# Set up Kubernetes keyring and repository
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list


sudo apt-get update
# install needed drivers/apps
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin ubuntu-drivers-common nvidia-container-runtime kubectl make git gh vim helm
sudo ubuntu-drivers autoinstall




# docker permission
sudo groupadd docker
sudo usermod -aG docker $USER


# add nvidia helm repo
helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
helm repo update


# clone and build kind with GPU support (details at https://jacobtomlinson.dev/posts/2022/quick-hack-adding-gpu-support-to-kind/)
gh auth login
gh repo clone jacobtomlinson/kind
cd kind
#Below line needs changes
git branch gpu && git pull origin gpu
make install


cd


# kind cluster config
cat <<EOF > kind-gpu.yaml
# kind-gpu.yaml
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
name: gpu-test
nodes:
 - role: control-plane
   gpus: true
EOF

# restart to make sure everything is configured properly
sudo reboot


# verify docker supports gpus
docker run --help | grep -i gpus
# verify docker container can see gpus
docker run -it --rm --gpus all ubuntu nvidia-smi
# create kind cluster for testing
~/kind/bin/kind  create cluster --config ~/kind-gpu.yaml
# helm install and set flag for default runtime

helm repo add nvidia https://helm.ngc.nvidia.com/nvidia \
    && helm repo update
helm install --wait --generate-name \
    -n gpu-operator --create-namespace \
    nvidia/gpu-operator
```
All the GPU worker nodes are identified by the presence of the label feature.node.kubernetes.io/pci-10de.present=true

Node Feature Discovery (NFD) is a dependency for the Operator on each node. By default, NFD master and worker are automatically deployed by the Operator. If NFD is already running in the cluster, then you must disable deploying NFD when you install the Operator.


To verify our image, we can set the image flag to point to our image.


Using kubectl,


```
kubectl set image rs/gpu-operator="${local.parsed.registry_repo}:${local.parsed.pseudo_tag}" -n gpu-operator -l app.kubernetes.io/name=gpu-operator
```


Output for reference:


```shell

```

