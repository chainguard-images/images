<!--monopod:start-->
# crane
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/crane` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/crane/overview).
* [View the Container Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for crane

Minimalist Wolfi-based crane image to interact with container registries. Crane is used for inspecting and manipulating container images, allowing you to view manifests, verify image layers, and check cryptographic signatures.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/crane:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Chainguard's `crane` image is comparable to the [official Crane image](https://gcr.io/go-containerregistry/crane). However, the Chainguard image contains only the minimum set of tools and dependencies needed to function. Additionally, it uses a different entrypoint, `/usr/bin/crane`, compared to upstream's entrypoint of `/ko-app/crane`.

## Getting started

You can inspect the `crane` image manifest using the `crane` image with the following command. The manifest provides a summary of key metadata about the image, including the image layers, digest information, annotations, and more.

```shell
docker run --rm cgr.dev/ORGANIZATION/crane:latest manifest cgr.dev/ORGANIZATION/crane:latest --platform=linux/amd64
```

When you run this command, you will receive output similar to the following:

```
{
  "schemaVersion": 2,
  "mediaType": "application/vnd.oci.image.manifest.v1+json",
  "config": {
    "mediaType": "application/vnd.oci.image.config.v1+json",
    "size": 968,
    "digest": "sha256:xxxxx"
  },
  "layers": [
    {
      "mediaType": "application/vnd.oci.image.layer.v1.tar+gzip",
      "size": 4990473,
      "digest": "sha256:xxxxx"
    }
  ],
  "annotations": {
    ......
  }
}
```

## Documentation and Resources

For more information, you can refer to the [official Crane documentation](https://gocrane.io/docs/). You might also find this [Crane CLI cheatsheet](https://github.com/google/go-containerregistry/blob/main/cmd/crane/doc/crane.md) to be useful.
<!--body:end-->

## What are Chainguard Containers?

[Chainguard Containers](https://www.chainguard.dev/containers?utm_source=readmes) are minimal container images that are secure by default. 

In many cases, the Chainguard Containers tagged as `:latest` contain only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager. Chainguard Containers are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_ designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with a `-dev` variant.

Although the `-dev` container image variants have similar security features as their more minimal versions, they feature additional software that is typically not necessary in production environments. We recommend using multi-stage builds to leverage the `-dev` variants, copying application artifacts into a final minimal container that offers a reduced attack surface that won’t allow package installations or logins.

## Learn More

To better understand how to work with Chainguard Containers, please visit [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes) and [Chainguard Courses](https://courses.chainguard.dev/?utm_source=readmes).

In addition to [Containers](https://www.chainguard.dev/containers?utm_source=readmes), Chainguard offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes). [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) to access additional products. 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._