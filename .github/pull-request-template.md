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
This checklist is mostly useful as a reminder of small things that can easily be
forgotten – it is meant as a helpful tool rather than hoops to jump through.

At the moment of this PR you have the most information on what all the change
will affect, so please take the time to jot it down.

Put an `x` in all the items that apply, make notes next to any that haven't been
addressed, and remove any items that are not relevant to this PR.
-->

- [ ] **IMPORTANT: 'image-request' tag has been applied if this PR is adding any images, including new versions or variants**

#### For new image PRs only

If you have an apko.yaml file in this PR you need to follow this checklist, otherwise feel free to remove.

- [ ]  Image is marked experimental or stable as appropriate
- [ ]  The last two minor versions are available
- [ ]  The latest tag points to the newest stable version
- [ ]  There is a dev tag available that includes a shell and apk tools (by depending on 'wolfi-base')
- [ ]  The image runs as `nonroot `and GID/UID are set to 65532
  - [ ]  Alternatively the username and GID/UID may be a commonly used one from the ecosystem e.g: postgres
  - [ ]  See above for exceptions to nonroot rule
- [ ]  ENTRYPOINT
  - [ ]  For applications/servers/utilities call main program with no arguments e.g. [redis-server]
  - [ ]  For base images leave empty
  - [ ]  For dev variants set to entrypoint script that falls back to system
- [ ]  CMD:
  - [ ]  For server applications give arguments to start in daemon mode (may be empty)
  - [ ]  For utilities/tooling bring up help e.g. `–help`
  - [ ]  For base images with a shell, call it e.g. [/bin/sh]
- [ ]  Consider where and how the image deviates from popular alternatives. Is there a good reason and is it documented?
- [ ]  Add annotations e.g:

        annotations:
          "org.opencontainers.image.authors": "Chainguard Team https://www.chainguard.dev/"
          "org.opencontainers.image.url": https://edu.chainguard.dev/chainguard/chainguard-images/reference/busybox/ #use the academy site here
          "org.opencontainers.image.source": https://github.com/chainguard-images/images/tree/main/images/bazel #use github here

- [ ]  Check if environment variables are needed e.g. to set data locations
- [ ]  Ensure the image responds to SIGTERM
  - [ ]   `docker kill $(docker run -d --rm cgr.dev/chainguard/nginx)`
- [ ]  Documentation. Let's make this excellent. Include usage example.
- [ ]  Error logs write to stderr and normal logs to stdout. DO NOT write to file.
- [ ]  Include tests, at the very least a basic smoke test.