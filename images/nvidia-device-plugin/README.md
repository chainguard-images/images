<!--monopod:start-->
# nvidia-device-plugin
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/nvidia-device-plugin` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/nvidia-device-plugin/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal [nvidia-device-plugin](https://github.com/NVIDIA/k8s-device-plugin) container image.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/nvidia-device-plugin:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Ensure your environment satisfies the [prerequisites](https://github.com/NVIDIA/k8s-device-plugin#prerequisites).

Jump to [Quick Start](https://github.com/NVIDIA/k8s-device-plugin#quick-start) to learn more.

To test:

```shell
$ docker run --rm cgr.dev/chainguard/nvidia-device-plugin --help

NAME:
   NVIDIA Device Plugin - NVIDIA device plugin for Kubernetes

USAGE:
   nvidia-device-plugin [global options] command [command options] [arguments...]

VERSION:
   v0.14.0
commit: e6c111aff19eab995e8d0f4345169e8c310d2f9c

COMMANDS:
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --mig-strategy value           the desired strategy for exposing MIG devices on GPUs that support it:
                                    [none | single | mixed] (default: "none") [$MIG_STRATEGY]
   --fail-on-init-error           fail the plugin if an error is encountered during initialization, otherwise block indefinitely (default: true) [$FAIL_ON_INIT_ERROR]
   --nvidia-driver-root value     the root path for the NVIDIA driver installation (typical values are '/' or '/run/nvidia/driver') (default: "/") [$NVIDIA_DRIVER_ROOT]
   --pass-device-specs            pass the list of DeviceSpecs to the kubelet on Allocate() (default: false) [$PASS_DEVICE_SPECS]
   --device-list-strategy value   the desired strategy for passing the device list to the underlying runtime:
                                    [envvar | volume-mounts | cdi-annotations] (default: "envvar")  (accepts multiple inputs) [$DEVICE_LIST_STRATEGY]
   --device-id-strategy value     the desired strategy for passing device IDs to the underlying runtime:
                                    [uuid | index] (default: "uuid") [$DEVICE_ID_STRATEGY]
   --gds-enabled                  ensure that containers are started with NVIDIA_GDS=enabled (default: false) [$GDS_ENABLED]
   --mofed-enabled                ensure that containers are started with NVIDIA_MOFED=enabled (default: false) [$MOFED_ENABLED]
   --config-file value            the path to a config file as an alternative to command line options or environment variables [$CONFIG_FILE]
   --cdi-annotation-prefix value  the prefix to use for CDI container annotation keys (default: "cdi.k8s.io/") [$CDI_ANNOTATION_PREFIX]
   --nvidia-ctk-path value        the path to use for the nvidia-ctk in the generated CDI specification (default: "/usr/bin/nvidia-ctk") [$NVIDIA_CTK_PATH]
   --container-driver-root value  the path where the NVIDIA driver root is mounted in the container; used for generating CDI specifications (default: "/driver-root") [$CONTAINER_DRIVER_ROOT]
   --help, -h                     show help (default: false)
   --version, -v                  print the version (default: false)
```

To use the Chainguard Images variant, override the values below in your `values.yaml` to use with [Helm](https://github.com/NVIDIA/k8s-device-plugin#deployment-via-helm):

```yaml
image:
  repository: cgr.dev/chainguard/nvidia-device-plugin
  tag: latest
```

When using this image with the `nvidia/gpu-operator` [helm chart](https://docs.nvidia.com/datacenter/cloud-native/gpu-operator/23.9.0/index.html) `bash` is required to run the mounted `/bin/entrypoint.sh` script.

For this you should use the `latest-dev` variant.

```
helm repo add nvidia https://helm.ngc.nvidia.com/nvidia
helm repo update

helm install --wait gpu  -n gpu-operator --create-namespace nvidia/gpu-operator
```
Values:
```yaml
driver:
   enabled: false
devicePlugin:
  repository: cgr.dev/chainguard
  image: nvidia-device-plugin
  tag: latest-dev
```
<!--body:end-->
