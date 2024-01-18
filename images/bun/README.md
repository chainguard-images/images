<!--monopod:start-->
# bun
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/bun` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/bun/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimal image with [bun](https://bun.sh/) tool.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/bun:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

The `bun` image contains the `bun` CLI and is most similar to the upstream `distroless` variant.

To get started:

```shell
$ docker run cgr.dev/chainguard/bun
Bun is a fast JavaScript runtime, package manager, bundler, and test runner. (1.0.20 (09d51486))

Usage: bun <command> [...flags] [...args]

Commands:
  run       ./my-script.ts       Execute a file with Bun
            lint                 Run a package.json script
  test                           Run unit tests with Bun
  x         prisma               Execute a package binary (CLI), installing if needed (bunx)
  repl                           Start a REPL session with Bun

  install                        Install dependencies for a package.json (bun i)
  add       svelte               Add a dependency to package.json (bun a)
  remove    @evan/duckdb         Remove a dependency from package.json (bun rm)
  update    jquery               Update outdated dependencies
  link      [<package>]          Register or link a local npm package
  unlink                         Unregister a local npm package
  pm <subcommand>                Additional package management utilities

  build     ./a.ts ./b.jsx       Bundle TypeScript & JavaScript into a single file

  init                           Start an empty Bun project from a blank template
  create    @zarfjs/zarf         Create a new project from a template (bun c)
  upgrade                        Upgrade to latest version of Bun.
  <command> --help               Print help text for command.

Learn more about Bun:            https://bun.sh/docs
Join our Discord community:      https://bun.sh/discord
```

<!--body:end-->
