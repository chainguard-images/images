<!--monopod:start-->
# bazel
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/bazel` |
| **Variants/Tags** | `latest` |
---
<!--monopod:end-->

[Bazel](https://github.com/bazelbuild/bazel) - A fast, scalable, multi-language and extensible build system.

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/bazel
```

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
