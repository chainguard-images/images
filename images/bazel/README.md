<!--monopod:start-->
# bazel
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/bazel` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/bazel/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[Bazel](https://bazel.build) - A fast, scalable, multi-language and extensible build system.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/bazel:latest
```
<!--getting:end-->

<!--body:start-->

## Using Bazel

We can use the Bazel examples to try this image.

first clone https://github.com/bazelbuild/examples

```sh
git clone git@github.com:bazelbuild/examples.git
```

change into the Java tutorial directory

```
cd examples/java-tutorial
```

now run the chainguard image, mounting the example and overwrite the entrypoint to bash

```sh
docker run --rm -ti --entrypoint bash -v ${PWD}:/home/bazel cgr.dev/chainguard/bazel
```

once in the container you can perform a build

```sh
bazel build //:ProjectRunner
```

and now run the example

```sh
bazel-bin/ProjectRunner
```

and see the message from the example application

```sh
Hi
```
<!--body:end-->
