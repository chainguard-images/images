# Notes on how this image was tested

The `nvidia-device-plugin` image required GPUs to test, therefore it is not currently covered by automated tests.

This document describes the manual steps taken to test the image on GCP.

Note, for testing we use a the `nvidia/gpu-operator` helm chart which requires bash so you will want to use the `latest-dev` variant.

```
cgr.dev/chainguard-private/nvidia-device-plugin:latest-dev
```

If users do not use the helm chart they can use the default image

```
cgr.dev/chainguard-private/nvidia-device-plugin:latest
```


Create a n1-standard-4 VM with ubuntu 22 LTS, T4 GPU (others should work), and 200GB disk.

Setup script:

```
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg apt-transport-https wget
sudo install -m 0755 -d /etc/apt/keyrings
# Docker keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
# docker repo
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
# nvidia keyrings
curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | \
  sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
# nvidia repo
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
# helm keyring
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null

# helm repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

# kubectl keyring
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
# kubectl repo
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

# pod to test gpu
cat <<EOF > gpu-pod.yaml
# gpu-pod.yaml
apiVersion: v1
kind: Pod
metadata:
  name: vectoradd
spec:
  restartPolicy: OnFailure
  containers:
  - name: vectoradd
    image: nvcr.io/nvidia/k8s/cuda-sample:vectoradd-cuda10.2
    resources:
      limits:
        nvidia.com/gpu: 1
EOF

# restart to make sure everything is configured properly
sudo reboot

# verify docker supports gpus
docker run --help | grep -i gpus
# verify docker container can see gpus
docker run -it --rm --gpus all ubuntu nvidia-smi
# create kind cluster for testing
~/kind/bin/kind  create cluster --config ~/kind-gpu.yaml
# install gpu-operator, drivers provides by host
helm install --wait gpu      -n gpu-operator --create-namespace      nvidia/gpu-operator --set driver.enabled=false
# create pod to verify gpu
kubectl apply -f ~/gpu-pod.yaml
# check pod can see gpu
kubectl logs vectoradd
```

To verify our image, we can edit the device-plugin daemonset created by the gpu-operator to point to our image.

With the gpu-operator, pass 

```
--set devicePlugin.repository=cgr.dev/chainguard-private \
  --set devicePlugin.image=nvidia-device-plugin \
  --set devicePlugin.version=latest-dev
```

or manually edit the daemonset kubectl edit -n gpu-operator ds nvidia-device-plugin-daemonset
