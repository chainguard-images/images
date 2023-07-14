# AWS tests

This directory contains terraform config to test the image using real AWS resources.

It's not hooked up to any other modules, so it must be run directly. To do so:

```sh
cd ./images/aws-ebs-csi-driver/aws-tests
terraform init
terraform apply
```

This requires you have AWS credentials previously set up.

When applied, this module:

1. creates an EBS volume and EKS cluster with access to the volume,
1. installs `aws-ebs-csi-driver` on the cluster,
1. creates a PersistentVolume backed by the EBS volume, and a PersistentVolumeClaim and Pod that uses it, and
1. watches the Pod's logs to see that a write to the volume has succeeded.

By default, the module tests the currently-live image at `cgr.dev/chainguard/aws-ebs-csi-driver:latest`.

To test a different image, set the `digest` variable, e.g.: `-var=digest=ttl.sh/blah/blah@sha256:...`

To debug the Pod and cluster:

```
$ aws eks list-clusters | jq -r .clusters[0]
ebs-driver-dynamic-spider
$ aws eks update-kubeconfig --region us-east-1 --name ebs-driver-dynamic-spider
```

Then you can see the Pod:

```
$ kubectl get pods
NAME                READY   STATUS
pod-safe-elephant   0/1     Pending
$ kubectl desribe pod test-pod-safe-elephant
...
```

This module _creates real cloud resources_, and those cost money, so when you're done testing, make sure to clean up after yourself:

```
terraform destroy
```

#### Updating `manifests`

The YAML in `./manifests` comes from:

- https://github.com/kubernetes-sigs/aws-ebs-csi-driver/tree/v1.21.0/deploy/kubernetes

Where necessary these are lightly templated (files ending in `.yaml.tpl`) to allow for variable substitution from Terraform.
