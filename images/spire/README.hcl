name                = "spire"
image               = "cgr.dev/chainguard/spire"
logo                = "https://storage.googleapis.com/chainguard-academy/logos/spire.svg"
endoflife           = ""
console_summary     = ""
short_description   = "Minimalist Wolfi-based `spire` images."
compatibility_notes = <<EOF
**Note**: Unlike most other Chainguard images, the `spire-agent` image must run as root.
This is due to a constraint in the way it is typically deployed into Kubernetes clusters.
See https://github.com/spiffe/spire/issues/1862 for more context.
EOF
readme_file         = "README.md"
upstream_url        = "https://spiffe.io/docs/latest/spire-about/"
