# Testing kubeflow-pipelines-visualization-server

This describes how we test the `kubeflow-pipelines-visualization-server` image on a real GPU instance on Cloud GPUs.

_Credit: Thanks to [Adrian Mouat](https://github.com/amouat) for providing the commands to create a GPU instance with Docker installed on GCP._

## Prerequisites

* `gcloud`

## Installation

1. Setup your GKE cluster:

```shell
gcloud compute instances create kubeflow-pipelines-visualization-server \
  --project=<PROJECT> \
  --zone=us-central1-a \
  --machine-type=n1-standard-1 \
  --network-interface=network-tier=PREMIUM,stack-type=IPV4_ONLY,subnet=default \
  --maintenance-policy=TERMINATE \
  --provisioning-model=STANDARD \
  --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append \
  --accelerator=count=1,type=nvidia-tesla-t4 \
  --create-disk=auto-delete=yes,boot=yes,device-name=instance-1,image=projects/ml-images/global/images/c0-deeplearning-common-gpu-v20240111-debian-11-py310,mode=rw,size=200,type=projects/adrian-mouat-test/zones/us-central1-a/diskTypes/pd-balanced \
  --no-shielded-secure-boot \
  --shielded-vtpm \
  --shielded-integrity-monitoring \
  --labels=goog-ec-src=vm_add-gcloud \
  --reservation-affinity=any
```

2. SSH into the instance:

```shell
gcloud compute ssh kubeflow-pipelines-visualization-server --zone us-central1-a
```

Verify the instance is up and running:

```shell
$ gcloud compute instances list
NAME                                     ZONE           MACHINE_TYPE   PREEMPTIBLE  INTERNAL_IP  EXTERNAL_IP    STATUS
kubeflow-pipelines-visualization-server  us-central1-a  n1-standard-1               10.XXX.X.X   XX.XX.XXX.XXX  RUNNING
```

3. Install the Nvidia drivers:

Once you SSH'd into the instance, you will be asked to install the Nvidia drivers:

```shell
Would you like to install the Nvidia driver? [y/n]
```

Type <kbd>y</kbd> and hit <kbd>Enter</kbd>.

4. Verify the installation:

Once the installation is complete, the following message will be displayed:

```shell
Nvidia driver installed.
```

Issue the following command to verify driver:

```shell
nvidia-smi
```

5. Install [nvidia-docker]:

Add to the repository:

```shell
distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add - && curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
```

Install `nvidia-docker2` and reload the Docker daemon configuration:

```shell
sudo apt-get update
sudo apt-get install -y nvidia-docker2
sudo systemctl restart docker
```

> [!TIP]
> Refer to [official documentation](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html) in case of any issues during installation.


6. Run the image on the background:

```shell
docker run --name kubeflow-pipelines-visualization-server -d --rm -it --gpus all -p 8888:8888 --workdir="/usr/share/app" cgr.dev/chainguard/kubeflow-pipelines-visualization-server:latest /usr/bin/python server.py
```

7. Run pre-defined test suite:

With `type="custom"`, `type="test"`:

```shell
$ curl -sf localhost:8888 --form 'type="test"' --form 'source="gs://ml-pipeline/data.csv"'
$ echo $?
0
```

With `type="roc_curve"`, `type="tfdv"`, `type="tfma"`:

```shell
$ curl -sf localhost:8888 --form 'type="tfma"' --form 'source="gs://ml-pipeline/data.csv"'
$ echo $?
22
```

> [!CAUTION]
> As you can see, the last command returns `22` which means the test failed. The error is: `KeyError: 'language_info'`. We also tested the upstream image to reproduce and confirm the issue. The issue is not related to our image. The upstream image is: `gcr.io/ml-pipeline/visualization-server:2.0.5`. You can test it by running the following command: `docker run -d --rm -it --gpus all -p 8888:8888 gcr.io/ml-pipeline/visualization-server:2.0.5`

8. Check the logs if something is wrong:

```shell
docker container logs kubeflow-pipelines-visualization-server
```

9. Teardown the instance:

```shell
gcloud compute instances delete kubeflow-pipelines-visualization-server --zone us-central1-a
```
