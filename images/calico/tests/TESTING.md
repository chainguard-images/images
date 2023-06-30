# Testing Calico images

The `calico-node` image is currently tested using a very basic test, that the image can be used in the `calico-node` DaemonSet.
This test is very simple, and this doc describes a more complete testing strategy for the image.

The full upstream test suite at `full-test.sh` takes a longer time to run, and should only be run manually.
This scripts clones the upstream repo, and runs the full test suite on the newly built image.

You can invoke the test with:

```shell
IMAGE_NAME=cgr.dev/chainguard/calico-node:latest ./full-test.sh
```

The test currently only runs on Linux.
