<!--monopod:start-->
# nvidia-gpu-driver
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nvidia-gpu-driver` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/nvidia-gpu-driver/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Tools necessary for GPU and feature discovery for NVIDIA GPU driver container that allows the provisioning of the NVIDIA driver through the use of containers.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nvidia-gpu-driver:latest
```
<!--getting:end-->

<!--compatibility:start-->
## Compatibility Notes

Users will need to install `donkey` as we don't ship it with this image since its archived and not maintained anymore. They also need to set the `TARGETARCH` env variable based on the arch.
<!--compatibility:end-->

<!--body:start-->

## Important Considerations
This image provides tools necessary for GPU and feature discovery, but it does not include the functionality to compile drivers directly within the container. It is important to understand that running the initialization scripts to configure the driver as provided will not be feasible without a host node and a Helm chart that correctly mounts all the required volumes from the host into the container.

1. **Host Node and Helm Chart Requirements**:
    - To use this image effectively, you need a host node with the appropriate hardware and drivers already installed.
    - A Helm chart is required to mount all the expected volumes from the host into the container. This includes device files, driver files, and other necessary resources.
  
2. **Initialization Scripts**:
    - The initialization scripts included in this image are meant for configuration purposes only. They cannot compile drivers within the container.
    - Ensure that the host node is properly configured before attempting to use these scripts.
  
3. **Volume Mounts**:
    - Proper volume mounts are crucial for the functionality of the tools provided in this image.
    - The Helm chart must define the necessary volume mounts to pass through GPU device files, configuration files, and other dependencies from the host node into the container.

## Usage

1. **Container Entry Point**:
    - The entry point is set to `sleep infinity`, which keeps the container running indefinitely. This allows for interactive configuration and troubleshooting.
    - Example command to run the container:
      ```sh
      docker run -d --name test-nvidia cgr.dev/chainguard/nvidia-gpu-driver:latest
      ```

2. **Interacting with the Container**:
    - Once the container is running, you can exec into the container to run the provided GPU and feature discovery tools.
    - Example command to exec into the container:
      ```sh
      docker exec -it test-nvidia /bin/bash
      ```
<!--body:end-->
