<!--monopod:start-->
# go-ipfs
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/go-ipfs` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/go-ipfs/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

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
kubo (previously named go-ipfs) is the first IPFS implementation and is the most widely used one today. Implementing the Interplanetary Filesystem - the Web3 standard for content-addressing, interoperable with HTTP. Thus powered by IPLD's data models and the libp2p for network communication. Kubo is written in Go.

## Usage

To start using IPFS, you must first initialize IPFS's config files on your system, this is done with ipfs init. See ipfs init --help for information on the optional arguments it takes. After initialization is complete, you can use ipfs mount, ipfs add and any of the other commands to explore!

```bash
docker run cgr.dev/chainguard/go-ipfs:latest help
```

For more information, refer to the ipfs documentation:
- [Ipfs GitHub](https://github.com/ipfs/kubo)
<!--body:end-->
