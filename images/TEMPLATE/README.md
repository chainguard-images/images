# Chainguard Images Template

This is a template README.md for new images.

1. Include a brief description of the image here, and instructions about how to use it.
1. Run `monopod readme`, which will update the top section of this file and the root README.md file.
1. Run `make tfgen`, which will update the generated root module config.
1. Update your new `config/template.apko.yaml` file to specify packages you want the image to include, and any other necessary image config.

If you need to support version streams, you can leave `packages` empty in `latest.apko.yaml`, and instead add packages to the images using the `extra_packages` TF variable in `config/main.tf`.
