<!--monopod:start-->
# openscap
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/openscap` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/openscap/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

NIST Certified SCAP 1.2 toolkit

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

The Chainguard `openscap` image is designed to be a drop-in replacement for the upstream [OpenSCAP toolkit](https://github.com/OpenSCAP/openscap).

## Getting Started

To retrieve information about a SCAP data stream, run a command like the following:

```shell
docker run --rm cgr.dev/ORGANIZATION/openscap:latest info /usr/share/xml/scap/ssg/content/ssg-chainguard-gpos-ds.xml
```
```
Document type: Source Data Stream
Imported: 2025-06-12T21:40:52
Stream: scap_org.open-scap_datastream_from_xccdf_all-resolved-xccdf-v3r2.xml
[... additional document information ...]
```

If you have SCAP content files that you want to evaluate, you can first create a directory to store the files:

```shell
mkdir -p scap-content
```

Then evaluate SCAP content by mounting the content directory. In the following example, we run an evaluation on the file /scap-content/your-oval-file.xml..."

```shell
docker run --rm \
  -v $(pwd)/scap-content:/scap-content \
  cgr.dev/ORGANIZATION/openscap:latest \
  oval eval --results /scap-content/results.xml /scap-content/your-oval-file.xml
```

> [!NOTE]
> Many security scanning operations require elevated privileges or access to host system information. Consider using `--privileged` or specific capability flags when performing system scans.

## Documentation and Resources

- [OpenSCAP User Manual](https://static.open-scap.org/openscap-1.3/oscap_user_manual.html)
- [NIST SCAP Documentation](https://csrc.nist.gov/projects/security-content-automation-protocol)
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