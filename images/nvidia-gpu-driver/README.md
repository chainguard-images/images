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
# Chainguard Image for nvidia-gpu-driver

Tools necessary for GPU and feature discovery for NVIDIA GPU driver container that allows the provisioning of the NVIDIA driver through the use of containers.

Chainguard Images are regularly-updated, minimal container images with low-to-zero CVEs.
<!--overview:end-->

<!--getting:start-->
## Download this Image
This image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/nvidia-gpu-driver:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard registry.
<!--getting:end-->

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

## Contact Support

If you have a Zendesk account (typically set up for you by your Customer Success Manager) you can reach out to Chainguard's Customer Success team through our [Zendesk portal](https://support.chainguard.dev/hc/en-us).

## What are Chainguard Images?

[Chainguard Images](https://www.chainguard.dev/chainguard-images?utm_source=readmes) are a collection of container images designed for security and minimalism.

Many Chainguard Images are [distroless](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started-distroless/); they contain only an open-source application and its runtime dependencies. These images do not even contain a shell or package manager. Chainguard Images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview), our Linux _undistro_ designed to produce container images that meet the requirements of a secure software supply chain.

The main features of Chainguard Images include:

* Minimal design, with no unnecessary software bloat
* Automated nightly builds to ensure Images are completely up-to-date and contain all available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) (software bills of materials) attesting the provenance of all artifacts within the Image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds))

### `-dev` Variants

As mentioned previously, Chainguard’s distroless Images have no shell or package manager by default. This is great for security, but sometimes you need these things, especially in builder images. For those cases, most (but not all) Chainguard Images come paired with a `-dev` variant which does include a shell and package manager.

Although the `-dev` image variants have similar security features as their distroless versions, such as complete SBOMs and signatures, they feature additional software that is typically not necessary in production environments. The general recommendation is to use the `-dev` variants only to build the application and then copy all application artifacts into a distroless image, which will result in a final container image that has a minimal attack surface and won’t allow package installations or logins.

That being said, it’s worth noting that `-dev` variants of Chainguard Images are completely fine to run in production environments. After all, the `-dev` variants are still **more secure** than many popular container images based on fully-featured operating systems such as Debian and Ubuntu since they carry less software, follow a more frequent patch cadence, and offer attestations for what they include.

## Learn More

To better understand how to work with Chainguard Images, we encourage you to visit [Chainguard Academy](https://edu.chainguard.dev/), our documentation and education platform.