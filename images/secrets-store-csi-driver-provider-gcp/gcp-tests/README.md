# GCP tests

This directory contains terraform config to test the image using real GCP resources.

It's not hooked up to any other modules, so it must be run directly. To do so:

```sh
cd ./images/secrets-store-csi-driver-provider-gcp/gcp-tests
terraform init
terraform apply -var=gcp_project=${PROJECT_ID}
```

When applied, this module:

1. creates a GCP Service Account and GCP secret, with super secret contents, which the Service account can access,
1. creates a GKE cluster with Workload Identity enabled, to act as the Service Account,
1. installs `secrets-store-csi-driver` on the cluster,
1. installs `secrets-store-csi-driver-provider-gcp` on the cluster,
1. creates a Pod with a volume mounted from the secret, via the provider, that logs the secret contents, and
1. watches the Pod's logs for the secret contents.

By default, the module tests the currently-live image at `cgr.dev/chainguard/secrets-store-csi-driver-provider-gcp:latest`.

To test a different image, set the `digest` variable, e.g.: `-var=digest=ttl.sh/blah/blah@sha256:...`

To debug the Pod and cluster:

```
gcloud container clusters get-credentials --project ${PROJECT_ID} --zone us-central1 secrets-store-csi-driver-provider-gcp
```

Then you can see the Pod:

```
$ kubectl get pods
NAME                     READY   STATUS
test-pod-safe-elephant   0/1     Pending
$ kubectl desribe pod test-pod-safe-elephant
...
$ kubectl logs test-pod-safe-elephant
s3cr3t
```

This module _creates real cloud resources_, and those cost money, so when you're done testing, make sure to clean up after yourself:

```
terraform destroy -var=gcp_project=${PROJECT_ID}
```

#### Updating `manifests`

The YAML in `./manifests` comes from:

- https://github.com/kubernetes-sigs/secrets-store-csi-driver/tree/v1.3.4/deploy
- https://github.com/GoogleCloudPlatform/secrets-store-csi-driver-provider-gcp/blob/v1.2.0/deploy/provider-gcp-plugin.yaml

Where necessary these are lightly templated (files ending in `.yaml.tpl`) to allow for variable substitution from Terraform.
