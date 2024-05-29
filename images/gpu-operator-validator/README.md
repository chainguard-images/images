<!--monopod:start-->
# gpu-feature-discovery
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/gpu-operator` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/gpu-operator/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal [gpu-operator](https://github.com/NVIDIA/gpu-operator) container image.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/gpu-feature-discovery:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

NVIDIA GPU Operator creates/configures/manages GPUs atop Kubernetes

For more information, refer to the GOV documentation:
- [GFD Github README](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/getting-started.html)

```shell
NAME:
   GPU NVIDIA GPU Operator creates/configures/manages GPUs atop Kubernetes

USAGE:
   
Step 1: Helm installation for GPU-Operator

This command deploys GPU Feature Discovery as a standalone chart in the gpu-feature-discovery namespace.
```shell
$ helm repo add nvidia https://helm.ngc.nvidia.com/nvidia \
    && helm repo update
helm install --wait --generate-name \
    -n gpu-operator --create-namespace \
    nvidia/gpu-operator
```

Node Feature Discovery (NFD) is a dependency for the Operator on each node. By default, NFD master and worker are automatically deployed by the Operator. If NFD is already running in the cluster, then you must disable deploying NFD when you install the Operator.

Step 3: Verify GPU Feature Discovery Deployments (gc and master)

```shell
$ kubectl get deploy -n gpu-operator -l app.kubernetes.io/name=node-feature-discovery
```

Step 4: Verify GPU Feature Discovery Daemonset (workers)

```shell
   kubectl get daemonset -n gpu-operator -l app.kubernetes.io/name=node-feature-discovery
```

Step 5: Change GPU Operator deployment

```shell
   kubectl set image rs/gpu-operator="${local.parsed.registry_repo}:${local.parsed.pseudo_tag}" -n gpu-operator -l app.kubernetes.io/name=gpu-operator
```

Step 6: Check logs

For more information, refer to the documentation:
- [Helm Installation Guide](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/latest/getting-started.html)

#Verification: Running Sample GPU Applications:

1) Create a file, such as cuda-vectoradd.yaml, with contents like the following:

```shell
apiVersion: v1
kind: Pod
metadata:
  name: cuda-vectoradd
spec:
  restartPolicy: OnFailure
  containers:
  - name: cuda-vectoradd
    image: "nvcr.io/nvidia/k8s/cuda-sample:vectoradd-cuda11.7.1-ubuntu20.04"
    resources:
      limits:
        nvidia.com/gpu: 1  
```

2) Run the pod:

```shell
kubectl apply -f cuda-vectoradd.yaml
```
The pod starts, runs the vectorAdd command, and then exits.

3) View the logs from the container:

```shell
kubectl logs pod/cuda-vectoradd
Example Output

[Vector addition of 50000 elements]
Copy input data from the host memory to the CUDA device
CUDA kernel launch with 196 blocks of 256 threads
Copy output data from the CUDA device to the host memory
Test PASSED
Done
```

Removed the stopped pod:

```shell
kubectl delete -f cuda-vectoradd.yaml
```
Example Output

```shell
pod "cuda-vectoradd" deleted
```

#Jupyter Notebook
You can perform the following steps to deploy Jupyter Notebook in your cluster:

1) Create a file, such as tf-notebook.yaml, with contents like the following example:

```shell
---
apiVersion: v1
kind: Service
metadata:
  name: tf-notebook
  labels:
    app: tf-notebook
spec:
  type: NodePort
  ports:
  - port: 80
    name: http
    targetPort: 8888
    nodePort: 30001
  selector:
    app: tf-notebook
---
apiVersion: v1
kind: Pod
metadata:
  name: tf-notebook
  labels:
    app: tf-notebook
spec:
  securityContext:
    fsGroup: 0
  containers:
  - name: tf-notebook
    image: tensorflow/tensorflow:latest-gpu-jupyter
    resources:
      limits:
        nvidia.com/gpu: 1
    ports:
    - containerPort: 8888
      name: notebook
```

2) Apply the manifest to deploy the pod and start the service:

```shell
kubectl apply -f tf-notebook.yaml
```
Check the pod status:

```shell
kubectl get pod tf-notebook
```
Example Output

```shell
NAMESPACE   NAME          READY   STATUS      RESTARTS   AGE
default     tf-notebook   1/1     Running     0          3m45s
```
Because the manifest includes a service, get the external port for the notebook:


```shell
kubectl get svc tf-notebook
```
Example Output

```shell
NAME          TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)       AGE
tf-notebook   NodePort    10.106.229.20   <none>        80:30001/TCP  4m41s
```
Get the token for the Jupyter notebook:

```shell
kubectl logs tf-notebook
```
Example Output

```shell
[I 21:50:23.188 NotebookApp] Writing notebook server cookie secret to /root/.local/share/jupyter/runtime/notebook_cookie_secret
[I 21:50:23.390 NotebookApp] Serving notebooks from local directory: /tf
[I 21:50:23.391 NotebookApp] The Jupyter Notebook is running at:
[I 21:50:23.391 NotebookApp] http://tf-notebook:8888/?token=3660c9ee9b225458faaf853200bc512ff2206f635ab2b1d9
[I 21:50:23.391 NotebookApp]  or http://127.0.0.1:8888/?token=3660c9ee9b225458faaf853200bc512ff2206f635ab2b1d9
[I 21:50:23.391 NotebookApp] Use Control-C to stop this server and shut down all kernels (twice to skip confirmation).
[C 21:50:23.394 NotebookApp]

To access the notebook, open this file in a browser:
   file:///root/.local/share/jupyter/runtime/nbserver-1-open.html
Or copy and paste one of these URLs:
   http://tf-notebook:8888/?token=3660c9ee9b225458faaf853200bc512ff2206f635ab2b1d9
or http://127.0.0.1:8888/?token=3660c9ee9b225458faaf853200bc512ff2206f635ab2b1d9
```
<!--body:end-->
