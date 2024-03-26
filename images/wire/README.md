<!--monopod:start-->
# wire
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/wire` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/wire/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based wire image for Go code generation.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/wire:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Run the wire image:

```
docker run --rm cgr.dev/chainguard/wire:latest help

Usage: wire <flags> <subcommand> <subcommand args>

Subcommands:
	check            print any Wire errors found
	commands         list all command names
	diff             output a diff between existing wire_gen.go files and what gen would generate
	flags            describe all known top-level flags
	gen              generate the wire_gen.go file for each package
	help             describe subcommands and their syntax
	show             describe all top-level provider sets
```
<!--body:end-->
