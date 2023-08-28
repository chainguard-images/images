<!--monopod:start-->
# semgrep
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/semgrep` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/semgrep/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

This image contains the CLI for the [Semgrep](https://semgrep.dev) static analysis tool.
Semgrep is a lightweight static analysis tool for many languages. Find bug variants with patterns that look like source code.

## Get It!

The image is available on `cgr.dev`:

```shell
$ docker pull cgr.dev/chainguard/semgrep:latest
Using default tag: latest
latest: Pulling from chainguard/semgrep
[...]
Status: Downloaded newer image for cgr.dev/chainguard/semgrep:latest
cgr.dev/chainguard/semgrep:latest
```

## Use It!

The image can be run directly and sets the semgrep binary as the entrypoint:

```shell
$ docker run cgr.dev/chainguard/semgrep:latest

Usage: semgrep [OPTIONS] COMMAND [ARGS]...

  To get started quickly, run `semgrep scan --config auto`

  Run `semgrep SUBCOMMAND --help` for more information on each subcommand

  If no subcommand is passed, will run `scan` subcommand by default

Options:
  -h, --help  Show this message and exit.

Commands:
  ci                   The recommended way to run semgrep in CI
  install-semgrep-pro  Install the Semgrep Pro Engine
  login                Obtain and save credentials for semgrep.dev
  logout               Remove locally stored credentials to semgrep.dev
  lsp                  [EXPERIMENTAL] Start the Semgrep LSP server
  publish              Upload rule to semgrep.dev
  scan                 Run semgrep rules on files
  shouldafound         Report a false negative in this project.

```
