# Testing the PyTorch-CUDA Image

While some functionality in PyTorch will run on CPU, full testing of
this image requires an environment with connected GPUs. Previous
testing has used a [Google Cloud deep learning
instance](https://cloud.google.com/deep-learning-vm) with connected
GPU, CUDA toolkit, and required NVIDIA drivers.

## Creating a Deep Learning VM

1. If you haven't already, install the [gcloud CLI](https://cloud.google.com/sdk/docs/install).
2. In GCP, create a project and grab the project ID or find the ID of
   your existing project. The ID is a descriptive string, not a
   number.
3. Run `gcloud init` in the terminal to authenticate to GCP. You may
   want to add the ID above at this step. You can set the project
   later with `gcloud config set project <project-id>`.
4. Once you're authenticated, review and set these environment
   variables as below. GPU aren't available in all zones and this
   changes. You can [review availability using gcloud
   cli](https://cloud.google.com/compute/docs/gpus/gpu-regions-zones),
   or you can [sneak a look at the GCP docs on creating an instance to
   see what their current default
   is](https://cloud.google.com/deep-learning-vm/docs/pytorch_start_instance)
   since it's pretty likely to work. You can also set the pytorch-cuda
   version if needed (see the above GCP docs) and name the instance.

    ```bash
    export IMAGE_FAMILY="pytorch-latest-gpu"
    export ZONE="us-west1-b"
    export INSTANCE_NAME="<name-of-instance>"
    ```

5. Run the following to create the instance:

``` bash
gcloud compute instances create $INSTANCE_NAME \
  --zone=$ZONE \
  --image-family=$IMAGE_FAMILY \
  --image-project=deeplearning-platform-release \
  --maintenance-policy=TERMINATE \
  --accelerator="type=nvidia-tesla-v100,count=1" \
  --metadata="install-nvidia-driver=True"
```

Some notes:

- If the above instructions aren't working, [check the GCP docs for an
  update](https://cloud.google.com/deep-learning-vm/docs/pytorch_start_instance).
- Using the above instructions, the CUDA drivers should be installed
  during image creation (that's the metadata tag).
- The maintenance policy needs to be set because GPU instances can't
  be moved live. If the realm changes or other maintenance occurs, the
  image will be shut down.

## Check CUDA and GPU Availability

```bash
$ nvcc --version
nvcc: NVIDIA (R) Cuda compiler driver
Copyright (c) 2005-2023 NVIDIA Corporation
Built on Mon_Apr__3_17:16:06_PDT_2023
Cuda compilation tools, release 12.1, V12.1.105
Build cuda_12.1.r12.1/compiler.32688072_0
```

Check that CUDA is available as a device:

```bash
$ echo "import torch;print(torch.cuda.is_available())"| python
True
```

Check the specific connected GPU. If more than one is connected, this will show the first.

```bash
$ echo "import torch;print(torch.cuda.get_device_name(0))" | python
Tesla V100-SXM2-16GB
```

## Run Image

Install [Docker Engine](https://docs.docker.com/engine/install/ubuntu/).

Run the image:

```bash
docker run --rm -i -t \
    --gpus all \
    cgr.dev/chainguard/pytorch:latest
```

## Documentation and Resources

- [Deep Learning VM Docs](https://cloud.google.com/deep-learning-vm/docs)
- [PyTorch-Specific instructions](https://cloud.google.com/deep-learning-vm/docs/pytorch_start_instance)
  (TF on same page)
