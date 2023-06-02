<!--monopod:start-->
# prometheus-mysqld-exporter
| | |
| - | - |
| **Status** | experimental |
| **OCI Reference** | `cgr.dev/chainguard/prometheus-mysqld-exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/prometheus-mysqld-exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal Prometheus Image

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/prometheus-mysqld-exporter:latest
```

## Usage

This image requires a MySQL crednetials file, and **does not** include one by default.
The default location that the `mysqld_exporter` expects this file to be placed at is `/home/mysqld_exporter/.my.cnf`

Examples can be found be found in the [MySQL documentation](https://dev.mysql.com/doc/refman/8.0/en/option-files.html).

THe default port that the mysqld_exporter listens on is 9104.

To test:

```shell
r.dev/chainguard/prometheus-mysqld-exporter
ts=2023-03-05T17:41:10.354Z caller=mysqld_exporter.go:226 level=info msg="Starting mysqld_exporter" version="(version=0.14.0, branch=main, revision=104e2f6d2c718485edb17f2632a65bf59aa9e9d0)"
ts=2023-03-05T17:41:10.355Z caller=mysqld_exporter.go:227 level=info msg="Build context" build_context="(go=go1.20.1, user=root@b09550c7a7e0, date=19700101-00:00:00)"
ts=2023-03-05T17:41:10.355Z caller=config.go:146 level=error msg="failed to validate config" section=client err="no user specified in section or parent"
ts=2023-03-05T17:41:10.355Z caller=mysqld_exporter.go:231 level=info msg="Error parsing host config" file=/home/mysqld_exporter/.my.cnf err="no configuration found"
```
