<!---
Provide a short summary in the Title above. Examples of good PR titles:
* "Image: add ruby v3.1"
* "Fix: fix haproxy v2.6 running as root"
* "Feature: Generate development friendly variants for all images"
-->

<!--
Please include references to any related issues. 
 -->

Fixes:

Related: 

### Pre-review Checklist

<!--
PLEASE REMOVE THE CHECKLIST ITEMS OR THE ENTIRE CHECKLIST IF THEY DON'T APPLY.

This checklist is mostly useful as a reminder of small things that can easily be
forgotten – it is meant as a helpful tool rather than hoops to jump through.

At the moment of this PR you have the most information on what all the change
will affect, so please take the time to jot it down.

Put an `x` in all the items that apply, make notes next to any that haven't been
addressed, and remove any items that are not relevant to this PR.
-->

- [ ] **IMPORTANT: 'image-request' tag has been applied if this PR is adding any images, including new versions or variants**

#### Quality Requirements for Images PRs
The items in this checklist should all be checked in the PR with exceptions clearly documented.
The general idea is that to the extent possible, the image should be a drop-in replacement to its public counterpart.
- [ ] Image is a smaller size than its common public counterpart, or if not, the reason why should be explained
- [ ] Image should be scanned for CVEs and should return 0 or near-0 results. Exceptions should be explained.
- [ ] The software in the image should be able to be installed and work as expected
  - [ ] The image should start in a cluster
  - [ ] The application should be accessible to the user/cluster/etc. as expected
- [ ] If there is an open source helm chart provided, the image should be able to be used with the chart. If needed, please add a -compat package to close any gaps with the public helm chart.
- [ ] If the upstream project provides automated build and functional tests, these should run successfully
- [ ] build for x86_64 and aarch64 if possible, document exceptions

#### For new image PRs only

If you have an apko.yaml file in this PR you need to follow this checklist, otherwise feel free to remove.
- [ ] Include tests, sufficient enough that you would trust this image running in production.
- [ ] Perform manual tests as needed and document your testing results
  - [ ] For builder images (go, python, etc), build a sample app successfully
  - [ ] For services images (rabbit, databases, webservers) test basic functionality, upstream install/getting started, port availability, admin access. Document differences from public image.
  - [ ] Applications intended for use with a specific cloud provider must be tested on that cloud provider.

- [ ] The version included is the latest GA version of the software
- [ ] The latest tag points to the newest stable version
- [ ] There is a dev tag available that includes a shell and apk tools (by depending on 'wolfi-base')
- [ ] The image runs as `nonroot` and GID/UID are set to 65532 or upstream default
  - [ ] Alternatively the username and GID/UID may be a commonly used one from the ecosystem e.g: postgres
- [ ] ENTRYPOINT
  - [ ] For applications/servers/utilities call main program with no arguments e.g. [redis-server]
  - [ ] For base images leave empty
  - [ ] For dev variants set to entrypoint script that falls back to system
- [ ] CMD:
  - [ ] For server applications give arguments to start in daemon mode (may be empty)
  - [ ] For utilities/tooling bring up help e.g. `–help`
  - [ ] For base images with a shell, call it e.g. [/bin/sh]

- [ ] Add annotations e.g:
```
annotations:
  "org.opencontainers.image.authors": "Chainguard Team https://www.chainguard.dev/"
  "org.opencontainers.image.url": https://edu.chainguard.dev/chainguard/chainguard-images/reference/busybox/ # use the academy site here
  "org.opencontainers.image.source": https://github.com/chainguard-images/images/tree/main/images/bazel # use github here
```
- [ ] Check if environment variables are needed e.g. to set data locations
- [ ] Ensure the image responds to SIGTERM
  - [ ] `docker kill $(docker run -d --rm cgr.dev/chainguard/nginx)`
- [ ] Error logs write to stderr and normal logs to stdout. DO NOT write to file.
#### Documentation Requirements

- [ ] Provide a README file, follow the [README template](readme-template.md) to include variants, tags, and usage examples
- [ ] Document your testing and results in the PR
- [ ] Document any exceptions to the testing and config requirements outlined in this template
- [ ] Document where and how the image deviates from popular alternatives (ports, packages, user, entrypoint, versions, etc). Explain why there's a difference and if the user needs to do anything differently when using the image