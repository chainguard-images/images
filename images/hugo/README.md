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
`hugo` and supporting libraries.  The Hugo process starts in `/hugo` by default
so this directory may be initialized with the Hugo site to serve.

- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/hugo)
- [Image Variants](https://edu.chainguard.dev/chainguard/chainguard-images/reference/hugo/image_specs/)
- [Provenance Info](https://edu.chainguard.dev/chainguard/chainguard-images/reference/hugo/provenance_info/)

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

The following is an example of using the Hugo image locally. It's based on the official [Hugo "quickstart"](https://gohugo.io/getting-started/quick-start/#commands) example.

To begin, start a shell in the Hugo developer (dev) container.

```shell
docker run -v $PWD/data:/home/data --entrypoint=/bin/sh -p 8080:8080 -it \
cgr.dev/chainguard/hugo:latest-dev
```

Create a new Hugo site using the quickstart commands.

```shell
hugo new site quickstart
```

Navigate into the new site's root directory.

```shell
cd quickstart
```

Initiate an empty Git repository 

```shell
git init
```

Clone a Hugo theme into the `themes` directory. 

```shell
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
```

Add a line to the site's configuration file to let Hugo know to use the new theme.

```shell
echo "theme = 'ananke'" >> hugo.toml
```

Start the Hugo development server to serve the site. Be sure to change the default bind address and port to make the site accessible outside of the container.

```shell
hugo serve --bind 0.0.0.0 --port 8080
```

Now open your browser to [localhost:8080](http://localhost:8080) to visit the sample site.

When finished, you can press `CTRL + C` to stop the Hugo server from running, and then `CTRL + D` to exit the container shell.

If you're interested in enterprise support, SLAs, and access to older tags, [get in touch](https://www.chainguard.dev/contact?utm_source=docs).