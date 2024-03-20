# `imagetest/helm` module

This module provides an easy way to generate a helm command using terraform.

## Examples

### Basic chart usage

The helm module has the ability to take values as an object and/or a path to a
values file within the sandbox container.

```terraform
module "helm" {
  source = "../../../helm"
  name   = "logstash"
  chart  = "logstash"
  repo   = "https://helm.elastic.co"
  values_files = ["/path/to/values.yaml"]
  values = {
    imageTag = "8.9.0"
  }
}

```

### Using a local chart

The helm module can also reference a local chart by omitting `repo` and using
`chart` to specify the path to the chart. You'll need to download the chart
into the sandbox container first then point the module to it.

```terraform
module "helm" {
  source = "../../../helm"
  name   = "test_local"
  chart  = "/path/to/chart/"
  values_files = ["/path/to/values.yaml"]
  values = {
    test1 = "foo"
    test2 = {
      bar = "baz"
    }
  }
}
```

### Overriding values

Helm has a concept of priority for values applied to a configuration. Read more
at https://helm.sh/docs/helm/helm_install/#synopsis. The `values_files` will be
a lower priority than the inline `values`. The `values_files` on the right will
have a higher priority than the left. For example

```terraform
module "helm" {
  source = "../../../helm"
  name   = "test_local"
  chart  = "/path/to/chart/"
  values_files = ["values.yaml", "override.yaml"]
  values = {
    foo = "bar"
}
```
This will be evaluated in the following order

* `values.yaml`
* `override.yaml` overrides anything in `values.yaml`
* `{foo: "bar"}` overrides `foo` in `override.yaml`
