<!--monopod:start-->
# hugo
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/hugo` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/hugo/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

This is a minimal [Hugo](https://gohugo.io/) image. The image only contains
`hugo` and supporting libraries.  The hugo process starts in `/hugo` by default
so this directory may be initialized with the Hugo site to serve.

- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/hugo)
- [Image Variants](https://edu.chainguard.dev/chainguard/chainguard-images/reference/hugo/image_specs/)
- [Provenance Info](https://edu.chainguard.dev/chainguard/chainguard-images/reference/hugo/provenance_info/)

## Image Variants

The following tagged variants are available without authentication:

- `latest`: This is a distroless image for running hugo to generate a website. It does not include `apk-tools` or `bash`, so no shell will be available.
- `latest-dev`: This is a development / builder image that includes `bash`, `apk-tools`, and `busybox`. This variant allows you to customize your final image with additional Wolfi packages.

### Pulling the Image
Run the following to pull the image to your local system and execute the command `hugo version`:

```shell
docker run --rm cgr.dev/chainguard/hugo version
```

You should get output similar to this:

```
hugo v0.119.0-b84644c008e0dc2c4b67bd69cccf87a41a03937e linux/amd64 BuildDate=2023-09-24T15:20:17Z
```

## Application Setup for End Users

Here is an example using the Hugo image to run the
["quickstart"](https://gohugo.io/getting-started/quick-start/#commands) locally:

```shell
# Start a shell in the Hugo "dev" container:
docker run -ti --rm -v -p 8080:8080 --entrypoint=/bin/sh \
       cgr.dev/chainguard/hugo:latest-dev

# Pass the quickstart commands (changing the bind address and port)
hugo new site quickstart
cd quickstart
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
echo "theme = 'ananke'" >> config.toml
hugo server --bind 0.0.0.0 --port 8080
```

Now open your browser to [localhost:8080](http://localhost:8080)!

FIf you're interested in enterprise support, SLAs, and access to older tags, [get in touch](https://www.chainguard.dev/chainguard-images).


