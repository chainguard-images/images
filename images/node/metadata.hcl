name                = "node"
image               = "cgr.dev/chainguard/node"
logo                = "https://storage.googleapis.com/chainguard-academy/logos/node.svg"
endoflife           = ""
console_summary     = ""
short_description   = "Minimal container image for running NodeJS apps"
compatibility_notes = <<EOF
The image specifies a default non-root `node` user (UID 65532), and a working directory at `/app`, owned by that `node` user, and accessible to all users.

It specifies `NODE_PORT=3000` by default.
EOF
readme_file         = "README.md"
upstream_url        = "https://nodejs.org/"
