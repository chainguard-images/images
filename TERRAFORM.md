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

During testing, or if certain packages are only supported for a particular
arch you will need to restrict what architectures are built.

To achieve this, set the `archs` variable when running locally. For example:

```shell
export TF_VAR_archs='["x86_64"]'
make image/ko
```
See [Assigning Values to Root Module Variables](https://developer.hashicorp.com/terraform/language/values/variables#assigning-values-to-root-module-variables).

The `[]`s are important here; omitting them results in an error saying `Variables may not be used here.`

You can also specify this in the apko configuration like so:

```yaml
archs:
  - x86_64
```

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

> [!NOTE]
> The paths must be absolute, and can't include `~` for the home directory.

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

There are two classes of tests that exist today, `oci_exec_test` and `imagetest`.

#### Testing with `oci_exec_test`

Tests using this resource execute scripts on the host machine. They are extremely simple to author. The currently built image is available to the script via the `IMAGE_NAME` environment variable.

A minimal example is below:

```hcl
data "oci_exec_test" "foo" {
  # A required image digest. This will be injected as environment variables to
  # whatever script is executed.
  digest = var.digest
  # A script that executes on the host with various context achieved and
  # plumbed through the provided digest as environment variables.
  script = <<EOF
    ...
  EOF
}
```

Some examples of these tests can be seen in

* [`ko`](./images/ko/tests/main.tf)
* [check reproducibility](./tflib/publisher/main.tf)

#### Testing with `imagetest`

`imagetest` is a custom provider built explicitly for the `images` release
process. The goal of `imagetest` is to simplify test authoring for both basic
and complex testing scenarios, while providing a safer, more abstract test
execution.

Part of the design of `imagetest` is that all resources created are ephemeral
by default, meaning unlike `oci_exec_test` which executes on the host machine
and requires explicit opt-in resource cleanup, everything created by
`imagetest` will be removed at completion. This makes test authoring simpler,
as any side effects or teardown logic is mostly irrelevant.

Since harnesses typically involve certain host tooling/configuration, please
skim the [local setup](#local-setup) section for the one-time configuration required for local
development.

A minimal test implemented with `imagetest` is below, commented where applicable:

```hcl
# A _required_ data source, used for keeping a provider internal inventory of
# which harnesses should be cleaned up and when. It's important to note that this should
# always be fully determined at _plan_ time. In other words, it should have no
# _apply_ time dependencies. To make this hard to mess up, this data source takes
# no inputs. The name of this data source does not matter, and multiple data
# sources can exist within the same terraform scope.
data "imagetest_inventory" "this" {}

# The imagetest provider provides multiple imagetest_harness_* resources that
# abstract the creation and configuration of various test harnesses. These test
# harnesses will be ephemeral to the lifecycle of the _apply_, and are typically
# authored with sensible defaults that require minimal configuration.
resource "imagetest_harness_k3s" "foo" {
  # The inventory this harness should be registered against. This is primarily
  # used for internal provider plumbing, and as such, the data format of the
  # input is explicitly the full data structure of `imagetest_inventory` (and not
  # the ID) to make it harder to mess up.
  inventory = data.imagetest_inventory.this

  # A required harness name. This must be unique within the scope of the
  # provided inventory. For example, defining another named "foo" harness with
  # the same `data.imagetest_inventory.this` is invalid, but another "foo"
  # harness with `data.imagetest_inventory.that` is valid and often normal,
  # such as when working with for_each'd modules.
  name = "foo"
}

# All tests run within a `imagetest_feature` resource, and are a set of
# instructions that run to completion. The way they are run and how they are run
# vary depending on the provided harness.
resource "imagetest_feature" "foo" {
  # A feature must have a harness, and much like the required inventory field
  # in the harness, this field is structured in a way to take the full data
  # structure of the harness (and not the ID) to make it harder to mess up. The
  # harness passed to the feature dictates _how_ the steps in the feature are
  # executed. These are documented in each of the available imagetest_harness_*
  # resources
  harness = imagetest_harness_k3s.foo

  # The name of the feature. This must be unique within a given harness.
  name = "Footure"
  # The optional description of the harness
  description = "My great footure"

  # Steps are a series of commands executed in order to completion. Depending
  # on the provided harness, these location and method of how these steps are
  # executed will vary, but in general, they are typically abstracted to operate
  # as shell scripts. For example, in this example, the `imagetest_harness_k3s`
  # is used, which means these steps will execute within a sandboxed `wolfi-base`
  # image that has `kubectl` pre-installed and pre-configured to connect to the
  # network attached k3s cluster. The intent with the harness feature setups is
  # always to absolve as boilerplate setup as possible from the test authors.
  steps = [
    {
      name = "Do a thing"
      cmd = <<EOF
        kubectl get po -A
      EOF
    },
    # Where applicable, additional step fields are available to hoist commonly
    # performed actions out of shell scripts and into the provider. The example
    # below shows an optional retry = {} block, which abstracts the common
    # approach of a bash retry loop with a simple provider resource definition
    {
      name = "Do a thing that may flake"
      cmd = "..."
      # Retry with a linear backoff (10s, then 20s, then 30s, ...)
      retry = { attempts = 5, delay = "10s" },
    },
    {
      name = "Do a another thing that may flake"
      cmd = "..."
      # Retry with an exponential backoff (5s, then 10s, then 20s)
      retry = { attempts = 3, delay = "5s", factor = "2" },
    },
  ]
}
```

The following serve as maintained examples that show off more of the capabilities of `imagetest`:

* [`cert-manager`](./images/cert-manager/tests/main.tf)
* [`prometheus-logstash-exporter`](./images/prometheus-logstash-exporter/tests/main.tf)
* [`calico`](./images/calico/tests/main.tf)

The provider attempts to abstract much of the common test authoring boilerplate
and toils as possible, but this also means sneaking in some unexpected logic.
For example, the harness teardown stage occurs _within_ the
`imagetest_feature`'s `Create()` lifecycle. Before every feature is completed,
the provider determines whether any remaining features referencing the harness
exist, and if none do, the harnesses teardown will get signaled. In the
majority of cases this is transparent to the user.

Finally, there are additional runtime environment variables that can be passed to support a development workflow:

- `IMAGETEST_SKIP_TEARDOWN`: Setting this env var to _anything_ at runtime
(`terraform apply`) will skip the teardown of all harnesses. This is useful for
debugging what went wrong with a failing feature.

##### local setup

Depending on the harnesses used, various tooling needs to exist and be
configured on the host machine. At the time of writing, the primary driver for
much of the harness scaffolding is through `docker`.

To prevent each harness from requiring the _same_ configuration, `provider`
level configs for each harness types are provided as a method for "global"
configuration.

Several copy/pasteable examples are below with descriptions for various local
development setups. To prevent different configurations from existing in the
tree, these are usually configured through a `main_override.tf` (see
[overrides](https://developer.hashicorp.com/terraform/language/files/override))
that is not commited.

If you're using a local docker backed registry:

```hcl
# main_override.tf
provider "imagetest" {
  harnesses = {
    # Configuration to apply to _all_ `imagetest_harness_k3s` resources created
    # with this provider
    k3s = {
      # Additional networks to attach to the any containers created by the harness.
      networks = {
        # If using k3d's registry, this wires in the k3d's registry network
        "k3d-default" = { name = "k3d-k3s-default" }
      }
      registries = {
        # Configure k3s' registry mirror to point to docker's magic host dns.
        # This lets the k3s cluster running in docker access the neighboring
        # registry also running in docker using the host endpoint.
        # NOTE: This magic dns is only available on windows and macos.
        "${element(split("/", var.target_repository), 0)}" = {
          mirror = { endpoints = ["http://host.docker.internal:5005"] }
        }
      }
    }
  }
}
```

If you're using a remote registry with a known and trusted cert (like `ttl.sh`), you likely will not need a `main_override.tf`.

If you're using a private remote registry:

```hcl
# main_override.tf
provider "imagetest" {
  harnesses = {
    k3s = {
      registries = {
        # Configure the k3s' containerd with credentials created from the
        # available `docker-credential-*`.
        # 
        # This example uses `docker-credential-gcloud` to obtain auth
        # credentials and plumb them through to k3s' registries.yaml
        "gcr.io" = { auth = {} }
        # This example uses `docker-credential-cgr` to obtain auth
        # credentials and plumb them through to k3s' registries.yaml
        "cgr.dev" = { auth = {} }
      }
    }
  }
}
```

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
