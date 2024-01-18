name                = "nginx"
image               = "cgr.dev/chainguard/nginx"
logo                = "https://storage.googleapis.com/chainguard-academy/logos/nginx.svg"
endoflife           = ""
console_summary     = ""
short_description   = "Minimal Wolfi-based nginx HTTP, reverse proxy, mail proxy, and a generic TCP/UDP proxy server"
compatibility_notes = <<EOF
On May 3, 2023 the Chainguard nginx Image was rebuilt with several improvements, including breaking changes. You may need to take action to update your application.

Specifically, the config file was changed to bring the default configuration closer to that of the official nginx image. If you override the config with a custom configuration, you should not be affected.

The changes included:

 - Moving the default port from `80` to `8080`. This is required to run on Kubernetes as a non-privileged user.
 - Setting nginx to automatically determine the number of worker processes
 - Moving the HTML directory to `/usr/share/nginx/html`

If you are unable to update currently, you can use the last build of the previous image:

```sh
docker pull cgr.dev/chainguard/nginx@sha256:bcc6b0d052298112e4644b258de0fa4dc1509e3df8f7c0fba09e8c92987825e7
```

This digest corresponds to nginx version 1.24.0. This image is not updated and you should migrate to the new configuration as soon as possible.
EOF
readme_file         = "README.md"
upstream_url        = "https://nginx.org"
