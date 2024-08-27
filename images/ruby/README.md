<!--monopod:start-->
# ruby
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/ruby` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/ruby/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal Ruby base image.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/ruby:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Ruby applications typically require the installation of third-party dependencies through [Rubygems](https://rubygems.org/). This means that using a fully distroless image for building your application would not work, as these do not include a package manager. In cases like this, you’ll need to implement a multi-stage Docker build that uses one of Chainguard's `-dev` Image variants to set up the application.

We encourage you to check out our guide on [getting started with Ruby](https://edu.chainguard.dev/chainguard/chainguard-images/getting-started/getting-started-ruby/) which demonstrates how you can use Chainguard's Ruby Image in both single- and multi-stage builds.
<!--body:end-->
