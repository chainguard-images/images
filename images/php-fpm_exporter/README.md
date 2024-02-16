<!--monopod:start-->
# php-fpm_exporter
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/php-fpm_exporter` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/php-fpm_exporter/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal php-fpm_exporter Image
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/php-fpm_exporter:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

This image is a drop-in replacement for the upstream image. 

Run docker manually:

```shell
docker pull cgr.dev/chainguard/php-fpm_exporter:latest
docker run -it --rm -e PHP_FPM_SCRAPE_URI="tcp://127.0.0.1:9000/status,tcp://127.0.0.1:9001/status" cgr.dev/chainguard/php-fpm_exporter:latest
``````

If you want to get more details about the php-fpm_exporter, please refer to the [official documentation](https://github.com/hipages/php-fpm_exporter#usage).
<!--body:end-->
