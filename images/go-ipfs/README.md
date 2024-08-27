<!--monopod:start-->
# go-ipfs
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/go-ipfs` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/go-ipfs/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based image for `go-ipfs`.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/go-ipfs:latest
```
<!--getting:end-->

<!--body:start-->

kubo (also referred to a go-ipfs) is a widely used implementation of the [The InterPlanetary File System (IPFS)](https://docs.ipfs.io/) protocol. \

This kubo image has the following features:
* An IPFS daemon server
* An HTTP RPC API for controlling the node
* An HTTP Gateway for serving content to HTTP browsers

## Usage

To start using IPFS, you must first initialize IPFS's config files on your system using the `ipfs init` command.
See `ipfs init --help` for information on the optional arguments it takes. After initialization is complete, you can use `ipfs mount`, `ipfs add` and any of the other built in commands.

The following set of commands demonstrate how to initialize and run the `ipfs` image.

First, create a volume for the IPFS files and set the owner to `nonroot`:
```bash
docker run \
    --rm -t \
    -v ipfs-data:/home/nonroot/.ipfs \
    cgr.dev/chainguard/bash \
    'chown nonroot:nonroot /home/nonroot/.ipfs'
```

Next run `ipfs init` with the volume:

```bash
docker run --rm -t -v ipfs-data:/home/nonroot/.ipfs cgr.dev/chainguard/go-ipfs:latest init
```

Finally, run an IPFS container with the volume mounted:

```bash
docker run \
    -v ipfs-data:/home/nonroot/.ipfs \
    -d --rm \
    -p "5001:5001" \
    --name "ipfs" \
    cgr.dev/chainguard/go-ipfs:latest daemon --migrate=true
```


```bash
docker run cgr.dev/chainguard/go-ipfs:latest help
```

For more information, refer to the ipfs documentation:
- [Ipfs GitHub](https://github.com/ipfs/kubo)
<!--body:end-->
