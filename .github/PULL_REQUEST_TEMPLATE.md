## New Image Pull Request Template

<!--
*** NEW IMAGE PULL REQUEST CHECKLIST: PLEASE START HERE WHEN CREATING NEW IMAGES***

* You are required to check at least one box per section -- no exceptions!

See BEST_PRACTICES.md for more information.
-->

### Image Size
<!--
Image size refers to the amount of disk space / storage space (i.e., MB, GB, etc.)
The common public counterpart is normally the public image available on Docker or equivalent public container registry
-->

- [ ] The Image is smaller in size than its common public counterpart.
- [ ] The Image is larger in size than its common public counterpart (please explain in the notes).

Notes:

### Image Vulnerabilities
<!-- The image should be scanned using the Grype vulnerability scanner -->

- [ ] The Grype vulnerability scan returned 0 CVE(s).
- [ ] The Grype vulnerability scan returned > 0 CVE(s) (please explain in the notes).

Notes:

### Image Tagging
<!-- The image should be tagged with :latest and maybe :latest-dev -->

- [ ] The image is _not_ tagged with version tags.
- [ ] The image is tagged with :latest
- [ ] The image is not tagged with :latest (please explain in the notes).

Notes:

### Basic Testing - K8s cluster
<!-- The container image should run in K8s -->

- [ ] The container image was successfully loaded into a kind cluster.
- [ ] The container image could not be loaded into a kind cluster (please explain in the notes).

Notes:

### Basic Testing - Package/Application
<!-- The package/application should start-up after launching in K8s -->

- [ ] The application is accessible to the user/cluster/etc. after start-up.
- [ ] The application is not accessible to the user/cluster/etc. after start-up. (please explain in the notes).

Notes:

### Helm
<!-- Upstream Helm charts are a great reference and they help ensure quality -->

- [ ] A Helm chart has been provided and the container image can be used with the chart.  If needed, please add a -compat package to close any gaps with the public helm chart.
- [ ] A Helm chart has been provided and the container image is not working with the chart (please explain in the notes).
- [ ] A Helm chart was not provided.

Notes:

### Processor Architectures

- [ ] The image was built and tested for x86_64.
- [ ] The image could not be built for x86_64 (please explain in the notes).
- [ ] The image was built and tested for aarch64.
- [ ] The image could not be built for aarch64. (please explain in the notes).

Notes:

### Functional Testing + Documentation
<!--
You are confident that a customer can run this image in production. Functional tests are a requirement -- no exceptions.

* For builder images (go, python, etc), build a sample app successfully
* For services images (rabbit, databases, webservers) test basic functionality, upstream install/getting started, port availability, admin access. Document differences from public image.
-->

- [ ] Functional tests have been included and the tests are passing.  All tests have been documnted in the notes section.

Notes:

### Environment Testing + Documentation
<!--
Some of our container images will require additional configuration to run on a public cloud provider.
-->

- [ ] There has not been a request and/or there is no indication that this image needs tested on a public cloud provider.
- [ ] The container image has been tested successfully on a public cloud provider (AWS, GCP, Azure).
- [ ] The container image has not been tested successfully on a public cloud provider (AWS, GCP, Azure) (please explain in the notes).

Notes:

### Version

- [ ] The package version is the latest version of the package.  The latest tag points to this version.
- [ ] The package version is the not the latest version of the package (please explain in the notes).

Notes:

### Dev Tag Availability

- [ ] There is a dev tag available that includes a shell and apk tools (by depending on 'wolfi-base')
- [ ] There is not a dev tag available that includes a shell and apk tools (by depending on 'wolfi-base') (please explain in the notes).

Notes:

### Access Control + Authentication

- [ ] The image runs as `nonroot` and GID/UID are set to 65532 or upstream default
- [ ] Alternatively the username and GID/UID may be a commonly used one from the ecosystem e.g: postgres
- [ ] The image requires a non-standard username or non-standard GID/UID (please explain in the notes).

### ENTRYPOINT

- [ ] applications/servers/utilities set to call main program with no arguments e.g. [redis-server]
- [ ] applications/servers/utilities not set to call main program with no arguments e.g. [redis-server] (please explain in the notes)
- [ ] base images leave empty.
- [ ] base image and not empty (please explain in the notes).
- [ ] dev variants is set to entrypoint script that falls back to system.
- [ ] dev variants is not set to entrypoint script that falls back to system (please explain in the notes).

### CMD

- [ ] For server applications give arguments to start in daemon mode (may be empty)
- [ ] For utilities/tooling bring up help e.g. `–help`
- [ ] For base images with a shell, call it e.g. [/bin/sh]

### Environment Variables

- [ ] Environment variables added.
- [ ] Environment variables not added and not required.

### SIGTERM

- [ ] The image responds to SIGTERM (e.g., `docker kill $(docker run -d --rm cgr.dev/chainguard/nginx)`)

### Logs

- [ ] Error logs write to stderr and normal logs to stdout. Logs DO NOT write to file.

### Documentation - README

- [ ] A README file has been provided and it follows the README template.
