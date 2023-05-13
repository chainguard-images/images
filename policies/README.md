This folder contains
[`ClusterImagePolicy`](https://docs.sigstore.dev/policy-controller/overview/)
resources which should apply to all Chainguard Images.

You can run these policies over a list of image references with:

```shell
export TF_VAR_image_refs='["foo", "bar", "baz"]'

terraform init
terraform apply
```
