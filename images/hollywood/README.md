<!--monopod:start-->
# hollywood
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/hollywood` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/hollywood/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

A fun, demo-only container image for [Hollywood](https://github.com/dustinkirkland/hollywood), which fills your terminal with busy technobabble -- as seen on Saturday Night Live, Netflix, CNBC, and more.

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
## What is Hollywood?

[Hollywood](https://hollywood.computer) is a fun, totally frivolous terminal application that fills your console with multiple panes of genuine technical melodrama -- perfectly suitable for busy-looking computers in the background of a film or TV set. It launches a tmux session, splits the terminal into a random number of randomly-sized panes, and runs a different noisy text-mode application in each pane, including `cmatrix`, `htop`, `bmon`, `ccze`, `apg`, `jp2a`, `speedometer`, `tree`, and more.

**This image is built purely for fun and demo purposes.** It doesn't solve any real problem that any real sysadmin or SRE has. It might, however, solve a very real problem that a TV or movie producer has -- making a computer screen look impressively busy on camera.

## As Seen On TV (and Film, and YouTube...)

Hollywood has been spotted in the wild in a number of productions, including:

* **Saturday Night Live** (NBC)
* **Unit 42** (Netflix)
* **Full Frontal with Samantha Bee**
* **NBC News** - internet security coverage
* **CNBC** - "Disruptor 50" segment featuring Attabotics
* **Yahoo Finance** - data breach reporting
* **Experian** - television commercial
* **SentinelOne** - television commercial
* **SUSE** - parody music video
* **Map Men** - YouTube series
* **Spy Ninjas / Project ZORGO** - YouTube series
* **DEFCON Music Channel** - Twitch
* **Texas A&M University Magazine** - Spring 2019 issue

For the latest sightings, see [hollywood.computer](https://hollywood.computer).

## Getting Started

This image is designed to run locally on your laptop or desktop in a terminal. It is interactive and requires a TTY -- this is not something you'd deploy into Kubernetes. It's great for showing off to your friends, running on a kiosk display at a conference, or making your screen look busy on a video call.

To run Hollywood:

```sh
docker run -it --rm cgr.dev/chainguard/hollywood:latest
```

For a fullscreen experience, maximize your terminal window first, then run the command above.

To stop it, press `q` or `Ctrl+C` repeatedly, then type `exit`.

### Using as a Video Call Background

Hollywood also makes a great virtual background for Zoom, Google Meet, or Teams calls. Run it in a maximized terminal and share that window, or record a loop to use as a virtual background video.

## Included Visual Widgets

This image includes a rich set of visual tools that Hollywood randomly selects from:

| Widget | Description |
|---|---|
| `atop` | Advanced system and process monitor |
| `cmatrix` | Matrix-style cascading green characters |
| `ccze` | Colorized log viewer |
| `htop` | Interactive process viewer |
| `jp2a` | JPEG/PNG to ASCII art converter |
| `openssh-client` | SSH visual art |
| `tree` | Directory tree visualization |

## Documentation and Resources

* [Hollywood homepage](https://hollywood.computer)
* [Hollywood on GitHub](https://github.com/dustinkirkland/hollywood)
* [Hollywood MP4 download](https://hollywood.computer) - suitable for Zoom/Meet virtual backgrounds
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