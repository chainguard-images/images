# Testing nvidia-container-toolkit

This describes how to test our `nvidia-container-toolkit` images on a real GKE cluster.

This document follows the official installation instructions https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/google-gke.html

We will going to use `gpu-operator` Helm chart to deploy and test the `nvidia-container-toolkit` images.

## Prerequisites

* `gcloud`
* `helm`
* `gpu-operator`

## Installation

1. Setup your GKE cluster:

```shell
gcloud beta container clusters create gpu-cluster \
      --project <PROJECT> \
      --zone us-west1-a \
      --release-channel "regular" \
      --machine-type "n1-standard-4" \
      --accelerator "type=nvidia-tesla-t4,count=1" \
      --image-type "UBUNTU_CONTAINERD" \
      --disk-type "pd-standard" \
      --disk-size "30" \
      --no-enable-intra-node-visibility \
      --metadata disable-legacy-endpoints=true \
      --max-pods-per-node "110" \
      --num-nodes "1" \
      --logging=SYSTEM,WORKLOAD \
      --monitoring=SYSTEM \
      --enable-ip-alias \
      --no-enable-intra-node-visibility \
      --default-max-pods-per-node "110" \
      --no-enable-master-authorized-networks \
      --tags=nvidia-ingress-all
```

2. Apply the following `ResourceQuota`:

```shell
cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: ResourceQuota
metadata:
  name: gpu-operator-quota
spec:
  hard:
    pods: 100
  scopeSelector:
    matchExpressions:
    - operator: In
      scopeName: PriorityClass
      values:
        - system-node-critical
        - system-cluster-critical
EOF
```

3. Use the one of the following methods to test the `nvidia-container-toolkit` image:

**Method 1:** Pull image from the Chainguard registry:

* Create your `values.yaml`:

```shell
cat <<EOF > values.yaml
toolkit:
  repository: cgr.dev/chainguard
  image: nvidia-container-toolkit
  version: latest
EOF
```

**Method 2:** Push the locally built image to ArtifactRegistry:

If you want to test an image that you've built locally, you'll need to create and push it to [ArtifactRegistry](https://cloud.google.com/artifact-registry) first.

* Ensure the registry is exist:

```shell
gcloud artifacts repositories list
crane ls <LOCATION>-docker.pkg.dev/<PROJECT>/<REPOSITORY>
```

* Build the image:
```shell
TF_VAR_target_repository=<LOCATION>-docker.pkg.dev/<PROJECT>/<REPOSITORY>/nvidia-container-toolkit TF_VAR_archs='["amd64"]' make image/nvidia-container-toolkit
```

> [!WARNING]
> `amd64` is used to test since the GCP GKE cluster is using the same architecture. Make sure to use the the correct architecture for the image.

* Check the image with [crane](https://github.com/google/go-containerregistry/blob/main/cmd/crane/README.md):

```shell
$ crane ls <LOCATION>-docker.pkg.dev/<PROJECT>/<REPOSITORY>/nvidia-container-toolkit
```

* Update the values file:

```shell
cat <<EOF > values.yaml
toolkit:
  repository: <LOCATION>-docker.pkg.dev/<PROJECT>/<REPOSITORY>
  image: nvidia-container-toolkit
  version: latest
  imagePullPolicy: Always
EOF
```

> [!WARNING]
> Don't forget to set `imagePullPolicy` to `Always` if you are going to use the `latest` tag for the debugging purposes.

* Or, you can also use the following steps to update the image after the deployment, to test the newer builds:

```shell
kubectl set image -n gpu-operator daemonset/nvidia-container-toolkit-daemonset nvidia-container-toolkit-ctr="<LOCATION>-docker.pkg.dev/<PROJECT>/<REPOSITORY>/nvidia-container-toolkit"
kubectl rollout restart daemonset -n gpu-operator nvidia-container-toolkit-daemonset
```

4. Install the `gpu-operator` Helm chart:

```shell
helm repo add nvidia https://nvidia.github.io/gpu-operator
helm upgrade --install gpu-operator nvidia/gpu-operator \
    -n gpu-operator \
    --create-namespace \
    -f values.yaml
```

> [!IMPORTANT]
> You will only see `gpu-operator-node-feature-discovery-*` workloads for the first a few minutes. The rest of the workloads will be created after everything is initialized and validated. Expect evey Pod to be in `Running` state. Usually, it takes about 10 minutes to have everything up and running.

5. Ensure everything is up and running:

```shell
NAME                                         DESIRED   CURRENT   READY   UP-TO-DATE   AVAILABLE   NODE gpu-feature-discovery-k8q6x                                   1/1     Running     0          5m43s
gpu-operator-7bbf8bb6b7-g7z99                                 1/1     Running     0          6m10s
gpu-operator-node-feature-discovery-gc-79d6d968bb-qvnlr       1/1     Running     0          8m55s
gpu-operator-node-feature-discovery-master-6d9f8d497c-ktfzs   1/1     Running     0          8m55s
gpu-operator-node-feature-discovery-worker-7xqrk              1/1     Running     0          8m55s
nvidia-container-toolkit-daemonset-sscl9                      1/1     Running     0          5m43s
nvidia-cuda-validator-95ph2                                   0/1     Completed   0          42s
nvidia-dcgm-exporter-2jfqc                                    1/1     Running     0          5m43s
nvidia-device-plugin-daemonset-2t62r                          1/1     Running     0          5m43s
nvidia-driver-daemonset-9cnfm                                 1/1     Running     0          5m59s
nvidia-operator-validator-zt2mt                               1/1     Running     0          5m43s
```

6. Check the logs if something is wrong:

```shell
kubectl logs daemonset/nvidia-container-toolkit-daemonset -c nvidia-container-toolkit-ctr -f
```

* Logs should be similar to the following:


<details>

<summary>Logs</summary>

```

Defaulted container "nvidia-container-toolkit-ctr" out of: nvidia-container-toolkit-ctr, driver-validation (init)
time="2024-05-03T17:25:19Z" level=info msg="Parsing arguments"
time="2024-05-03T17:25:19Z" level=info msg="Starting nvidia-toolkit"
time="2024-05-03T17:25:19Z" level=info msg="Verifying Flags"
time="2024-05-03T17:25:19Z" level=info msg=Initializing
time="2024-05-03T17:25:19Z" level=info msg="Installing toolkit"
time="2024-05-03T17:25:19Z" level=info msg="disabling device node creation since --cdi-enabled=false"
time="2024-05-03T17:25:19Z" level=info msg="Installing NVIDIA container toolkit to '/usr/local/nvidia/toolkit'"
time="2024-05-03T17:25:19Z" level=info msg="Removing existing NVIDIA container toolkit installation"
time="2024-05-03T17:25:19Z" level=info msg="Creating directory '/usr/local/nvidia/toolkit'"
time="2024-05-03T17:25:19Z" level=info msg="Creating directory '/usr/local/nvidia/toolkit/.config/nvidia-container-runtime'"
time="2024-05-03T17:25:19Z" level=info msg="Installing NVIDIA container library to '/usr/local/nvidia/toolkit'"
time="2024-05-03T17:25:19Z" level=info msg="Finding library libnvidia-container.so.1 (root=)"
time="2024-05-03T17:25:19Z" level=info msg="Checking library candidate '/usr/lib64/libnvidia-container.so.1'"
time="2024-05-03T17:25:19Z" level=info msg="Resolved link: '/usr/lib64/libnvidia-container.so.1' => '/usr/lib/libnvidia-container.so.1.15.0'"
time="2024-05-03T17:25:19Z" level=info msg="Installing '/usr/lib/libnvidia-container.so.1.15.0' to '/usr/local/nvidia/toolkit/libnvidia-container.so.1.15.0'"
time="2024-05-03T17:25:19Z" level=info msg="Installed '/usr/lib/libnvidia-container.so.1.15.0' to '/usr/local/nvidia/toolkit/libnvidia-container.so.1.15.0'"
time="2024-05-03T17:25:19Z" level=info msg="Creating symlink '/usr/local/nvidia/toolkit/libnvidia-container.so.1' -> 'libnvidia-container.so.1.15.0'"
time="2024-05-03T17:25:19Z" level=info msg="Finding library libnvidia-container-go.so.1 (root=)"
time="2024-05-03T17:25:19Z" level=info msg="Checking library candidate '/usr/lib64/libnvidia-container-go.so.1'"
time="2024-05-03T17:25:19Z" level=info msg="Resolved link: '/usr/lib64/libnvidia-container-go.so.1' => '/usr/lib/libnvidia-container-go.so.1.15.0'"
time="2024-05-03T17:25:19Z" level=info msg="Installing '/usr/lib/libnvidia-container-go.so.1.15.0' to '/usr/local/nvidia/toolkit/libnvidia-container-go.so.1.15.0'"
time="2024-05-03T17:25:19Z" level=info msg="Installed '/usr/lib/libnvidia-container-go.so.1.15.0' to '/usr/local/nvidia/toolkit/libnvidia-container-go.so.1.15.0'"
time="2024-05-03T17:25:19Z" level=info msg="Creating symlink '/usr/local/nvidia/toolkit/libnvidia-container-go.so.1' -> 'libnvidia-container-go.so.1.15.0'"
time="2024-05-03T17:25:19Z" level=info msg="Installing executable '/usr/bin/nvidia-container-runtime' to /usr/local/nvidia/toolkit"
time="2024-05-03T17:25:19Z" level=info msg="Installing '/usr/bin/nvidia-container-runtime' to '/usr/local/nvidia/toolkit/nvidia-container-runtime.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed '/usr/local/nvidia/toolkit/nvidia-container-runtime.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed wrapper '/usr/local/nvidia/toolkit/nvidia-container-runtime'"
time="2024-05-03T17:25:19Z" level=info msg="Installing executable '/usr/bin/nvidia-container-runtime.cdi' to /usr/local/nvidia/toolkit"
time="2024-05-03T17:25:19Z" level=info msg="Installing '/usr/bin/nvidia-container-runtime.cdi' to '/usr/local/nvidia/toolkit/nvidia-container-runtime.cdi.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed '/usr/local/nvidia/toolkit/nvidia-container-runtime.cdi.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed wrapper '/usr/local/nvidia/toolkit/nvidia-container-runtime.cdi'"
time="2024-05-03T17:25:19Z" level=info msg="Installing executable '/usr/bin/nvidia-container-runtime.legacy' to /usr/local/nvidia/toolkit"
time="2024-05-03T17:25:19Z" level=info msg="Installing '/usr/bin/nvidia-container-runtime.legacy' to '/usr/local/nvidia/toolkit/nvidia-container-runtime.legacy.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed '/usr/local/nvidia/toolkit/nvidia-container-runtime.legacy.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed wrapper '/usr/local/nvidia/toolkit/nvidia-container-runtime.legacy'"
time="2024-05-03T17:25:19Z" level=info msg="Installing NVIDIA container CLI from '/usr/bin/nvidia-container-cli'"
time="2024-05-03T17:25:19Z" level=info msg="Installing executable '/usr/bin/nvidia-container-cli' to /usr/local/nvidia/toolkit"
time="2024-05-03T17:25:19Z" level=info msg="Installing '/usr/bin/nvidia-container-cli' to '/usr/local/nvidia/toolkit/nvidia-container-cli.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed '/usr/local/nvidia/toolkit/nvidia-container-cli.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed wrapper '/usr/local/nvidia/toolkit/nvidia-container-cli'"
time="2024-05-03T17:25:19Z" level=info msg="Installing NVIDIA container runtime hook from '/usr/bin/nvidia-container-runtime-hook'"
time="2024-05-03T17:25:19Z" level=info msg="Installing executable '/usr/bin/nvidia-container-runtime-hook' to /usr/local/nvidia/toolkit"
time="2024-05-03T17:25:19Z" level=info msg="Installing '/usr/bin/nvidia-container-runtime-hook' to '/usr/local/nvidia/toolkit/nvidia-container-runtime-hook.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed '/usr/local/nvidia/toolkit/nvidia-container-runtime-hook.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed wrapper '/usr/local/nvidia/toolkit/nvidia-container-runtime-hook'"
time="2024-05-03T17:25:19Z" level=info msg="Creating symlink '/usr/local/nvidia/toolkit/nvidia-container-toolkit' -> 'nvidia-container-runtime-hook'"
time="2024-05-03T17:25:19Z" level=info msg="Installing executable '/usr/bin/nvidia-ctk' to /usr/local/nvidia/toolkit"
time="2024-05-03T17:25:19Z" level=info msg="Installing '/usr/bin/nvidia-ctk' to '/usr/local/nvidia/toolkit/nvidia-ctk.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed '/usr/local/nvidia/toolkit/nvidia-ctk.real'"
time="2024-05-03T17:25:19Z" level=info msg="Installed wrapper '/usr/local/nvidia/toolkit/nvidia-ctk'"
time="2024-05-03T17:25:19Z" level=info msg="Installing NVIDIA container toolkit config '/usr/local/nvidia/toolkit/.config/nvidia-container-runtime/config.toml'"
time="2024-05-03T17:25:19Z" level=info msg="Skipping unset option: nvidia-container-runtime.log-level"
time="2024-05-03T17:25:19Z" level=info msg="Skipping unset option: nvidia-container-runtime.mode"
time="2024-05-03T17:25:19Z" level=info msg="Skipping unset option: nvidia-container-runtime.modes.cdi.annotation-prefixes"
time="2024-05-03T17:25:19Z" level=info msg="Skipping unset option: nvidia-container-runtime.runtimes"
time="2024-05-03T17:25:19Z" level=info msg="Skipping unset option: nvidia-container-cli.debug"
time="2024-05-03T17:25:19Z" level=info msg="Skipping unset option: nvidia-container-runtime.debug"
Using config:
accept-nvidia-visible-devices-as-volume-mounts = false
accept-nvidia-visible-devices-envvar-when-unprivileged = true

[nvidia-container-cli]
  ldconfig = "@/run/nvidia/driver/sbin/ldconfig.real"
  path = "/usr/local/nvidia/toolkit/nvidia-container-cli"
  root = "/run/nvidia/driver"

[nvidia-container-runtime]

  [nvidia-container-runtime.modes]

    [nvidia-container-runtime.modes.cdi]
      default-kind = "management.nvidia.com/gpu"

[nvidia-container-runtime-hook]
  path = "/usr/local/nvidia/toolkit/nvidia-container-runtime-hook"
  skip-mode-detection = true

[nvidia-ctk]
  path = "/usr/local/nvidia/toolkit/nvidia-ctk"
time="2024-05-03T17:25:19Z" level=info msg="Setting up runtime"
time="2024-05-03T17:25:19Z" level=info msg="Parsing arguments: [/usr/local/nvidia/toolkit]"
time="2024-05-03T17:25:19Z" level=info msg="Successfully parsed arguments"
time="2024-05-03T17:25:19Z" level=info msg="Starting 'setup' for containerd"
time="2024-05-03T17:25:19Z" level=info msg="Loading config from /runtime/config-dir/config.toml"
time="2024-05-03T17:25:19Z" level=info msg="Flushing config to /runtime/config-dir/config.toml"
time="2024-05-03T17:25:19Z" level=info msg="Sending SIGHUP signal to containerd"
time="2024-05-03T17:25:19Z" level=info msg="Successfully signaled containerd"
time="2024-05-03T17:25:19Z" level=info msg="Completed 'setup' for containerd"
time="2024-05-03T17:25:19Z" level=info msg="Waiting for signal"
```
</details>

7. Teardown the cluster:

```shell
gcloud container clusters delete gpu-cluster
```
