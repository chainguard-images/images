# Chainguard Images-as-Code

This file describes the broad strokes of the Terraform layout we use for
defining Chainguard "Images-as-Code" using Terraform.  There are roughly three
layers to this structure:
1. The top-level "mega module" (largely defined in `main.tf`),
2. The per-image modules (defined in `images/{foo}/*.tf`), and
3. The per-image test modules (defined in `images/{foo}/tests/main.tf`).

## Goals (`tl;dr`)

One of the goals of this work has been to structure things so that folks can
pretty quickly and easily iterate on an image with one command:

```shell
make init
make image/foo
```

## Invoking modules

Let's walk through each of the above layers.

### Building ALL Images

We define a "mega module" in the root of the repository, which can be used to
build ALL of our images in one go.  This module exposes a single variable:
`target_repository`, which can be defined using the `TF_VAR_target_repository`
environment variable.

You can build everything with:

```shell
# This is where your images will be pushed to. This should have the form:
#   - ghcr.io/mattmoor
#   - ttl.sh/jason
#   - gcr.io/my-project
# Individual image names will be appended to the above (e.g ttl.sh/jason/go, etc)
# Bear in mind the visibility of the repository you are publishing to!
export TF_VAR_target_repository=...

make init
make all
```

This will take a lot of time, because there are a lot of images. During normal
development, only build one or two images at a time.

### Building a single Image module

Every image defines a module in `images/{foo}` that can be used to build, sign,
attest, test, and tag all of its variants. The Makefile in this project defines
a handy target `image/%` that abstracts the Terraform invocation to build an
image:

```shell
make image/ko
```

This target can be supplied multiple times to build multiple image directories,
for example ko, crane and consul:

```shell
make image/ko image/crane image/consul
```

### Building for certain architectures

By default all Wolfi-based images are built for `x86_64` (`amd64`) and `aarch64` (`arm64`),
and Alpine-based images are built for all architectures supported by Alpine.

During testing it can be useful to only build for certain architectures, such as the host architecture.

To achieve this, set the `archs` variable. For example:

```shell
export TF_VAR_archs='["x86_64"]'
make image/ko
```

See [Assigning Values to Root Module Variables](https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables).

The `[]`s are important here; omitting them results in an error saying `Variables may not be used here.`

### Building from local packages

During testing it can be useful to build images from packages you've built and signed locally.

To achieve this, set the `extra_repositories` and `extra_keyring` variables. For example,
```shell
export TF_VAR_extra_repositories='["/path/to/packages"]'
export TF_VAR_extra_keyring='["/path/to/local-signing.rsa.pub"]'
make image/ko
```

See [Assigning Values to Root Module Variables](https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables).

The `[]`s are required here; omitting them results in an error saying `Variables may not be used here.`

### More `make image` target options

The following `make` options are valid for `make image`:

* `TF_AUTO_APPROVE` to allow the user to control whether `--auto-approve` will be used in Terraform or not. If
    `--auto-approve` is not desired when running `make image/image-name`, make sure to either export `TF_AUTO_APPROVE=0`
    or pass it to `make`, for example
    ```console
    make TF_AUTO_APPROVE=0 image/image-name
    ```

    The only false value is 0, every other value will be interpreted to be true.

### Running Tests

Every image defines a module in `images/{foo}/tests` that can be used to run the
tests for a particular image.  Generally these modules expose a single input
variable: `digest`, which can be defined using `TF_VAR_digest=...`.

For example, I can run the tests for a ko image with:
```shell
cd images/ko/tests

# Upgrade is useful in case there's prior state, or
# run "git clean -fxd" first.
terraform init -upgrade

# This should have the form:
#   ghcr.io/mattmoor/ko@sha256:deadbeef
# Note that the image reference must be specified by digest.
TF_VAR_digest=... terraform apply
```

Virtually all tests require Docker installed locally to run.

Many tests require access to a Kubernetes cluster, such as a local [KinD cluster](https://kind.sigs.k8s.io/).
These tests may install a Helm chart and/or issue `kubectl` commands against the cluster.
The tests use the config file at `$HOME/.kube/config` to connect to the cluster.

### Building with `apko` directly

<!-- TODO(jason): Build some other way to emit the resolved apko YAML -->

Images in this repo are designed to be built with Terraform as described above, but they can also be built directly with `apko`:

To build a Wolfi-based image:

```shell
make cfg=images/static/configs/wolfi.apko.yaml apko-build
```

To build an Alpine-based image (i.e., `static:latest`, `busybox:latest`, `git:latest`)

```shell
make cfg=images/static/configs/alpine.apko.yaml apko-build-alpine
```

These will build the image into a tarball in the local directory, which can be loaded into Docker with `docker load < image.tar`.

## Creating new image scaffolding

When creating a new image in this repository, you can run `monopod scaffold`
from the root of this repository to generate a basic scaffolding:
```shell
monopod scaffold my-new-image --entrypoint /usr/bin/test-app
```

This will generate the following folder structure, providing you with a basic
structure to get started building images:
```console
images/
└── my-new-image
    ├── README.md
    ├── config
    │   ├── template.apko.yaml
    │   └── main.tf
    ├── main.tf
    └── tests
        ├── EXAMPLE_TEST.sh
        └── main.tf
```

You can then make the necessary changes to get your image working,
such as extra required packages and tests.

For a full list of `monopod scaffold` options, run `monopod scaffold --help`.

## Using apks downloaded from GitHub Artifacts

The public repo uses GitHub Actions to build packages. It then uploads the packages to GitHub Artifacts. We can download the packages from GitHub Artifacts and uses them to build images before actually creating the PR to ensure that the packages are going to work with the image.

1. Download the package from GitHub Artifacts.
2. Copy the package to the `packages/<arch>/` directory.
3. Sign the package with `melange sign --signing-key melange.rsa <apk>` but do not forget to create a key/pair for signing with `melange keygen`.
4. Update the locally exist `APKINDEX.tar.gz` at the same folder with apks using `melange index -m -s APKINDEX.tar.gz *.apk`.
5. Sign the index itself `melanges sign-index --signing-key melange.rsa APKINDEX.tar.gz`.
6. Run the command to build the image as usual. The image will be built using the local packages instead of downloading from the internet.

### Building using a local registry and `k3d` cluster

During both presubmit and postsubmit, `k3s` (via `k3d`) is used as the target Kubernetes cluster. While this isn't a perfect encapsulation of all production environments, it is a good reflection of the smoke tests that releases require.

For the best chance at reproducing CI results and working with a representative environment, your environment can be set up as follows:

#### Prerequisites

The following tools are required:

- k3d
  - requires docker, or some remote docker daemon
- kubectl

#### Setup

```bash
# Create a local registry managed by k3d
k3d registry create k3d.localhost --port 5005

# Create the k3d cluster
k3d cluster create \
    --k3s-arg "--disable=traefik@server:0" \
    --k3s-arg "--disable=metrics-server@server:0" \
    --registry-use k3d-k3d.localhost:5005
```

Alternatively, a `make` target is available for those who don't require any special options:

```bash
make k3d
```

For both cases, one time operations are required to ensure localhost DNS is properly functioning:

```bash
# Ensure the registry is accessible locally
echo "127.0.0.1 k3d-k3d.localhost" | sudo tee -a /etc/hosts

# Some tests (like the toolchains) test that images can be sufficiently built. We need to ensure the insecure local registry is accepted by the docker daemon
# Ref: https://docs.docker.com/registry/insecure/#deploy-a-plain-http-registry
```

#### Run a test

Assuming the setup above is complete, replace the `target_repository` variable with the newly created local registry.

The example below outlines running a single build for `haproxy-ingress`:

```bash
❯ terraform apply -target 'module.haproxy-ingress' -var=target_repository="k3d-k3d.localhost:5005"
```

#### Gotchas

Kubernetes is perfectly encapsulated with common APIs... right? Almost... for the most part, an app deployed on GKE or EKS vs k3s _should_ install the same way, there are a few common gotchas that are listed below:

##### Load Balancers

Some applications (like [`haproxy-ingress`](https://github.com/chainguard-images/images/blob/main/images/haproxy-ingress/tests/main.tf#L20)) require a load balancer to be provisioned.

`k3s` ships with a [builtin load balancer](https://docs.k3s.io/networking#service-load-balancer) that can support a single IP claim. This means multiple ingress controllers or load balancers will conflict. For testing, ensure that only a single ingress controller and/or load balancer are deployed at any given time.

> `k3s` also ships with `traefik-ingress-controller` by default, but you'll notice this is disabled in the above `k3d cluster create` command.

##### Volumes

Some applications (like [`external-dns`](https://github.com/chainguard-images/images/blob/main/images/external-dns/tests/e2e.sh#L90)) hard code the required `StorageClass` for dynamic `PersistentVolumes`.

`k3s` ships with `local-path-provisioner` as the default `StorageClass`. For applications requiring `PersistentVolumes` that use hard coded `StorageClasses`, you need to ensure that it references the default `local-path`.

##### Cluster name

Some applications (like [`aws-load-balancer-controller`](https://github.com/chainguard-images/images/blob/main/images/aws-load-balancer-controller/tests/main.tf#L26)) require a specific hard coded cluster name.

By default, the cluster name of the `k3d` clusters created for the dev setup are named `k3d-k3s-default`. 

##### Docker network

Some tests require referencing a specific docker network to ensure they're isolated on the `k3s` "internal" network.

By default, the clusters docker network is named `k3d-k3s-default`.
