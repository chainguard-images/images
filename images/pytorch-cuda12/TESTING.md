Since testing this image requires GPU's, CUDA toolkit and NVidia drivers, this document gives an high level overview of the setup needed to run/test this image. Google Cloud has been used for all our testing setup.

# Installation
1. Create a VM with GPUs

    
    ```gcloud compute instances create pytorch-testing \
    --zone=us-central1-a \
    --machine-type=n1-standard-4 \
    --accelerator="type=nvidia-tesla-t4,count=2" \
    --boot-disk-size=200GB \
    --boot-disk-type=pd-standard \
    --image-family=ubuntu-2204-lts \
    --image-project=ubuntu-os-cloud \
    --maintenance-policy=TERMINATE \
    --restart-on-failure```
    

Verify that NVIDIA card is detected
    ```lspci -vv | grep -i nvidia```
    
    a. Setup docker for future usage
        https://docs.docker.com/engine/install/ubuntu/


2. Installing NVIDIA driver and toolkit
Install the new cuda-keyring package:

    ```
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb
    sudo dpkg -i cuda-keyring_1.1-1_all.deb
    ```

    Enroll the new signing key manually:

    ```wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-archive-keyring.gpg
    sudo mv cuda-archive-keyring.gpg /usr/share/keyrings/cuda-archive-keyring.gpg
    ```

    ```sudo apt-get update
       sudo apt-get install cuda-12-3
    ```
    

        Not needed, should be covered by the cuda-12-3 installation
        ```
        sudo apt-get install cuda-toolkit
        sudo apt-get install nvidia-gds
        ```

    Reboot the system before proceeding 

    ```sudo reboot```

    Update PATH
    
    ```export PATH=/usr/local/cuda/bin:$PATH``` 

3. Run Image

    ```sudo docker run --gpus all -it --rm cgr.dev/chainguard/pytorch:latest```

4. Test scripts to run
    ```
    $ python
    >>> import torch
    >>> print(torch.cuda.is_available())
    True
    ```

Reference:
https://collabnix.com/introducing-new-docker-cli-api-support-for-nvidia-gpus-under-docker-engine-19-03-0-beta-release/

https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html#ubuntu



