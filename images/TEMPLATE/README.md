This is a template for creating configs for new images.

Include a brief description of the image here, and instructions about how to use it.

When you're done, run `monopod readme` to update the top section of this file, and update the root README.md file.

To get started, run:

```sh
cp -R images/TEMPLATE images/[new-image-name]
```

Then, update your new `config/template.apko.yaml` file to specify packages you want the image to include, and any other necessary image config.

If you need to support version streams, you can leave `packages` empty in `template.apko.yaml`, and instead add packages to the images using the `extra_packages` TF variable in `config/main.tf`.
