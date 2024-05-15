# Notes on how this image was tested

The `gpu-feature-discovery` image required GPUs to test, therefore it is not currently covered by automated tests.

This document describes the manual steps taken to test the image on GCP.

Note, for testing we use a `nvidia/gpu-feature-discovery` helm chart which requires bash so you will want to use the `latest-dev` variant.

```
cgr.dev/chainguard-private/gpu-feature-discovery:latest-dev
```

If users do not use the helm chart they can use the default image

```
cgr.dev/chainguard-private/pu-feature-discovery:latest
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
# helm install and set flag for default runtime 
helm repo add nvgfd https://nvidia.github.io/gpu-feature-discovery
helm repo update
helm search repo nvgfd --devel
helm upgrade -i nvgfd nvgfd/gpu-feature-discovery   --version 0.8.2   --namespace gpu-feature-discovery   --create-namespace
helm list -A
helm upgrade nvgfd -n gpu-feature-discovery --set runtimeClassName=nvidia nvgfd/gpu-feature-discovery
```

To verify our image, we can set the image flag to point to our image.

Using helm upgrade, --set 

```
helm upgrade nvgfd -n gpu-feature-discovery --set image.repository=cgr.dev/chainguard-private/gpu-feature-discovery,image.tag="latest" nvgfd/gpu-feature-discovery
```

Output for reference:

```shell
root@nvgfd-gpu-feature-discovery-gpu-feature-discovery-r4ms2:/# gpu-feature-discovery --oneshot 
I0509 19:17:30.455943      54 main.go:139] Starting OS watcher.
I0509 19:17:30.456406      54 main.go:144] Loading configuration.
I0509 19:17:30.457702      54 main.go:156] 
Running with config:
{
  "version": "v1",
  "flags": {
    "migStrategy": "none",
    "failOnInitError": true,
    "gdsEnabled": null,
    "mofedEnabled": null,
    "useNodeFeatureAPI": false,
    "gfd": {
      "oneshot": true,
      "noTimestamp": false,
      "sleepInterval": "1m0s",
      "outputFile": "/etc/kubernetes/node-feature-discovery/features.d/gfd",
      "machineTypeFile": "/sys/class/dmi/id/product_name"
    }
  },
  "resources": {
    "gpus": null
  },
  "sharing": {
    "timeSlicing": {}
  }
}
I0509 19:17:30.459674      54 factory.go:49] Detected NVML platform: found NVML library
I0509 19:17:30.459723      54 factory.go:49] Detected non-Tegra platform: /sys/devices/soc0/family file not found
I0509 19:17:30.459741      54 factory.go:65] Using NVML manager
I0509 19:17:30.459762      54 main.go:170] Start running
I0509 19:17:30.487471      54 main.go:239] Creating Labels
I0509 19:17:30.487490      54 output.go:74] Writing labels to output file /etc/kubernetes/node-feature-discovery/features.d/gfd
I0509 19:17:30.487808      54 main.go:136] Exiting
```

