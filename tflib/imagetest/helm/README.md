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
  values = {
    imageTag = "8.9.0"
  }
  values_file = "/path/to/values.yaml"
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
  values = {
    test1 = "foo"
    test2 = {
      bar = "baz"
    }
  }
  values_file = "/path/to/values.yaml"
}
```

