# [IMAGE_NAME]

Minimal Wolfi-based IMAGE_NAME images for IMAGE_FEATURES.

- [Documentation](https://edu.chainguard.dev/chainguard/chainguard-images/reference/[IMAGE_NAME])
- [Getting Started Guide](https://edu.chainguard.dev/chainguard/chainguard-images/reference/[IMAGE_NAME]/getting-started-[IMAGE_NAME]/)
- [Image Variants](https://edu.chainguard.dev/chainguard/chainguard-images/reference/[IMAGE_NAME]/image_specs/)
- [Provenance Info](https://edu.chainguard.dev/chainguard/chainguard-images/reference/[IMAGE_NAME]/provenance_info/)

## Image Variants

The following tagged variants are available without authentication:

- `latest`: [DESCRIPTION_LATEST].
- `latest-dev`: [DESCRIPTION_LATEST_DEV]
- [OTHER_VARIANTS]

### Pulling the Image
Run the following to pull the image to your local system and execute the command `[PULL_EXAMPLE_COMMAND]`:

```shell
docker run --rm cgr.dev/chainguard/[IMAGE_NAME] [PULL_EXAMPLE_COMMAND]
```

You should get output similar to this:

```
[EXAMPLE_COMMAND_OUTPUT]
```

## Application Setup for End Users

When creating a Dockerfile to extend from these images, the recommended approach is to set up a multi-stage build so that you're able to install your dependencies on a separate environment and then copy the files over to a smaller production image.

For example, the following Dockerfile will [DOCKERFILE_DESCRIPTION]

```Dockerfile
[DOCKERFILE_EXAMPLE]
```

For more detailed information on how to use these images, check [LEARN_MORE_LINK]. If you're interested in enterprise support, SLAs, and access to older tags, [get in touch](https://www.chainguard.dev/chainguard-images).
