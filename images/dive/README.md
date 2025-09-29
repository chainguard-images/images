<!--monopod:start-->
# REPO_NAME
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/REPO_NAME` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/REPO_NAME/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Minimal [dive](https://github.com/wagoodman/dive) container image.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/REPO_NAME:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Compatibility Notes

Chainguard's `dive` container image is comparable to the [upstream image](https://github.com/wagoodman/dive), with the following differences:

* Like all other Chainguard Containers, `dive` features a stripped down, minimal design
* It has few-to-zero CVEs
* It does not run as the root user

## Getting started

You need to mount the Docker socket so Dive can access your local images:
```
docker run --rm -it \
  -v /var/run/docker.sock:/var/run/docker.sock \
  cgr.dev/ORGANIZATION/dive:latest <your-image-tag>
```

If the image is not present locally, Dive will pull it from the registry

### Output
This outputs a summary including image efficiency and wasted space, suitable for automated pipelines
```
Analyzing image...
  efficiency: 99.0268 %
  wastedBytes: 3569864 bytes (3.6 MB)
  userWastedPercent: 3.5550 %
Inefficient Files:
Count  Wasted Space  File Path
    2        1.6 MB  /var/cache/debconf/templates.dat
    2        1.5 MB  /var/cache/debconf/templates.dat-old
    2        201 kB  /var/lib/dpkg/status
    2        201 kB  /var/lib/dpkg/status-old
    2         21 kB  /var/cache/debconf/config.dat
    2         20 kB  /var/cache/debconf/config.dat-old
    2         18 kB  /etc/ld.so.cache
    2         13 kB  /var/lib/apt/extended_states
    2         11 kB  /var/log/apt/eipp.log.xz
    2        1.7 kB  /etc/passwd
    2        1.7 kB  /etc/passwd-
    2         968 B  /etc/shadow
    2         881 B  /etc/group
    2         868 B  /etc/group-
    2         738 B  /etc/gshadow
    2           0 B  /var/lib/dpkg/triggers/Lock
    2           0 B  /var/lib/dpkg/triggers/Unincorp
    2           0 B  /var/lib/dpkg/lock
Results:
  PASS: highestUserWastedPercent
  SKIP: highestWastedBytes: rule disabled
  PASS: lowestEfficiency
Result:PASS [Total:3] [Passed:2] [Failed:0] [Warn:0] [Skipped:1]
```

## Documentation and Resources
**[Github Repository](https://github.com/wagoodman/dive)**

<!--body:end-->

## What are Chainguard Containers?

Chainguard's free tier of Starter container images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our minimal Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_.

All other Chainguard Containers are built with [Chainguard OS](https://edu.chainguard.dev/chainguard/chainguard-os/overview/?utm_source=readmes), Chainguard's minimal Linux operating system designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with [a *development*, or `-dev`, variant](https://edu.chainguard.dev/chainguard/chainguard-images/about/differences-development-production/).

In all other cases, including Chainguard Containers tagged as `:latest` or with a specific version number, the container images include only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager.

Although the `-dev` container image variants have similar security features as their more minimal versions, they include additional software that is typically not necessary in production environments. We recommend using multi-stage builds to copy artifacts from the `-dev` variant into a more minimal production image.

## Need additional packages?

To improve security, Chainguard Containers include only essential dependencies. Need more packages? Chainguard customers can use [Custom Assembly](https://edu.chainguard.dev/chainguard/chainguard-images/features/ca-docs/custom-assembly/) to add packages, either through the Console, `chainctl`, or API.

To use Custom Assembly in the Chainguard Console: navigate to the image you'd like to customize in [your Organization's list of images](https://console.chainguard.dev/images/organization), and click on the **Customize image** button at the top of the page.

## Learn More

Refer to our Chainguard Containers documentation on [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes). Chainguard also offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes) — [contact us](https://www.chainguard.dev/contact?utm_source=readmes) for access.
 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._