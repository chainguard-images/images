<!--monopod:start-->
# lean
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/lean` |


* [View container image in the Chainguard Containers Directory](https://images.chainguard.dev/directory/image/lean/versions) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/contact?utm_source=readmes) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
# Chainguard Container for REPO_NAME

Lean 4 programming language and proof assistant, with a variant that includes the Mathlib math library, ready to use with no download.

Chainguard Containers are regularly-updated, secure-by-default container images.
<!--overview:end-->

<!--getting:start-->
## Download this Container Image
For those with access, this container image is available on `cgr.dev`:

```
docker pull cgr.dev/ORGANIZATION/REPO_NAME:latest
```

Be sure to replace the `ORGANIZATION` placeholder with the name used for your organization's private repository within the Chainguard Registry.
<!--getting:end-->

<!--body:start-->
## Choosing a Tag

[Lean](https://lean-lang.org/) is a programming language and proof assistant: you write definitions and theorems, and Lean checks that every proof is correct. The `lean` image comes in two variants, and each has a `-dev` version:

| Tag | Use it when | Size |
| - | - | - |
| `latest` | You write Lean programs or proofs that need only Lean's built-in libraries. | about 5 GB |
| `latest-mathlib` | You want [Mathlib](https://leanprover-community.github.io/), the community library of formalized mathematics, or [CSLib](https://github.com/leanprover/cslib), its computer science counterpart. Both come compiled, so `import Mathlib` works at once, with no download. Building Mathlib yourself takes hours. | about 12 GB |
| `latest-dev`, `latest-mathlib-dev` | You want to work inside the container, or build your own image on top of it. The `-dev` tags add the `apk` package manager, `curl`, `wget`, `vim` (also as `vi`), `less`, and `ps`. | slightly larger |

The `latest` and `latest-dev` tags have the newest Lean release. The `-mathlib` tags follow the newest Lean release that Mathlib and CSLib support, so for a short time after a Lean release they can have an older Lean than the other tags. To see which Lean version a tag has, run:

```sh
docker run --rm cgr.dev/ORGANIZATION/lean:latest-mathlib -c 'lean --version'
```

Use the tags without `-dev` in CI and production, where you need fewer packages.

The image works like the community `leanprovercommunity/lean4` image: its entrypoint is a `bash` login shell, and it runs as the user `lean` (UID 1000) in `/home/lean`.

## Prerequisites

The first pull downloads about 5 GB, or about 12 GB for a `-mathlib` tag, so allow for the time and disk space.

A file that does `import Mathlib` loads about 6.5 GB of library files. Lean still runs with less memory than that, but it is then slower, because it reads the files from disk again on each run. To keep the files in memory between runs, give Docker Desktop or your CI runner more memory than that, or import only the parts of Mathlib that a file uses, such as `import Mathlib.Tactic.Ring`.

## Getting Started

Start a shell in the container, with Lean and Lake on the `PATH`:

```sh
docker run -it --rm cgr.dev/ORGANIZATION/lean:latest-mathlib
```

To check a file instead, create one that proves an identity with Mathlib and prints a value:

```sh
cat > Square.lean <<EOF
import Mathlib.Tactic.Ring

/-- The square of a sum, expanded. -/
theorem square (a b : ℤ) : (a + b) ^ 2 = a ^ 2 + 2 * a * b + b ^ 2 := by
  ring

#eval (3 + 4 : ℤ) ^ 2
EOF
```

Mount the current directory into the container, and pass the command to the shell with `-c`:

```sh
docker run --rm -v "$PWD:/home/lean/src" -w /home/lean/src cgr.dev/ORGANIZATION/lean:latest-mathlib -c 'lean Square.lean'
```

Lean prints the value of the `#eval` line, and no errors, because the proof is correct:

```
49
```

If you change the theorem to a false statement, Lean prints an error that names the step that failed. A proof that uses `sorry` passes with a warning; add `-DwarningAsError=true` to make that an error.

## Building a Project with Lake

Lake is Lean's build tool, and it comes with Lean. A Lake project keeps its settings in a `lakefile.toml` file, and `lake build` checks and compiles all of the project's files.

Create a library project in the current directory. The container runs as UID 1000. On Linux, if your user has a different UID, the container cannot write to the mounted directory, so add `--user "$(id -u):$(id -g)"`. The files then belong to you:

```sh
docker run --rm -v "$PWD:/home/lean/src" -w /home/lean/src cgr.dev/ORGANIZATION/lean:latest-mathlib -c 'lake new proofs lib'
```

Replace its module with one that uses Mathlib and CSLib:

```sh
cat > proofs/Proofs/Basic.lean <<EOF
import Mathlib.Tactic.Ring
import Cslib.Computability.Automata.DA.Basic

open Cslib Automata

/-- A ring identity proved against the bundled Mathlib. -/
theorem cube (a b : ℤ) : (a + b) ^ 3 = a ^ 3 + 3 * a ^ 2 * b + 3 * a * b ^ 2 + b ^ 3 := by
  ring

/-- A CSLib automaton that never leaves its start state. -/
def still : DA Unit Nat where
  tr _ _ := ()
  start := ()
EOF
```

Build it, treating warnings as errors:

```sh
docker run --rm -v "$PWD/proofs:/home/lean/proofs" -w /home/lean/proofs cgr.dev/ORGANIZATION/lean:latest-mathlib -c 'lake build --wfail'
```

Do not add `require mathlib` or `require cslib` to the lakefile. Without them, Lake uses the copies that come with the image. With them, Lake downloads and builds its own copies, which takes hours and needs network access.

## Using elan

Lean users often install [elan](https://github.com/leanprover/elan), which installs the Lean version that each project names in its `lean-toolchain` file. No tag includes elan, and the images do not read `lean-toolchain` files, because elan downloads Lean from upstream, not from Chainguard. To stay on Chainguard's Lean, set your project's `lean-toolchain` file to the Lean version in the image.

If you need elan, install the Chainguard package in a `-dev` image, then register the image's Lean under the name that elan uses:

```dockerfile
FROM cgr.dev/ORGANIZATION/lean:latest-dev
USER root
RUN apk add --no-cache elan
USER lean
RUN elan-init -y --no-modify-path --default-toolchain none \
 && version=$(lean --version | sed -n 's/^Lean (version \([0-9.]*\),.*/\1/p') \
 && ~/.elan/bin/elan toolchain link "leanprover/lean4:v${version}" /usr \
 && ~/.elan/bin/elan default "leanprover/lean4:v${version}"
ENV PATH="/home/lean/.elan/bin:${PATH}"
```

`lake new` writes that name, `leanprover/lean4:v<version>`, to a new project's `lean-toolchain` file, so the project builds with the image's Lean and elan downloads nothing. A project that names any other Lean version makes elan download it from upstream, and that version cannot use the libraries that come with a `-mathlib` image.

## How the Image Differs from a Usual Lean Installation

- Lean installs under `/usr`. Every library in the image is compiled with that Lean release.
- The libraries install under `/usr/lib/lean`, where `lean` and `lake` always look for them, and their sources install under `/usr/src/lean`, so an editor can jump to a definition. The image does not set `LEAN_PATH`.
- The libraries are compiled for checking proofs and running code with `#eval` and `lean --run`. A native program that you build with `lake build` can only call Lean's built-in libraries (`Init`, `Std`, and `Lean`), not Mathlib or CSLib.
- The image sets its user by UID, so that Kubernetes `runAsNonRoot` can check it.

## Documentation and Resources

- [Lean documentation](https://lean-lang.org/documentation/)
- [Mathlib documentation](https://leanprover-community.github.io/mathlib4_docs/)
- [Lake reference](https://lean-lang.org/doc/reference/latest/Build-Tools-and-Distribution/Lake/)
- [CSLib repository](https://github.com/leanprover/cslib)
- [elan repository](https://github.com/leanprover/elan)
<!--body:end-->

## What are Chainguard Containers?

Chainguard's free tier of Starter container images are built with [Wolfi](https://edu.chainguard.dev/open-source/wolfi/overview?utm_source=readmes), our minimal Linux _[undistro](https://edu.chainguard.dev/open-source/wolfi/overview/#why-undistro)_.

All other Chainguard Containers are built with [Chainguard OS](https://edu.chainguard.dev/chainguard/chainguard-os/overview/?utm_source=readmes), Chainguard's minimal Linux operating system designed to produce container images that meet the requirements of a more secure software supply chain.

The main features of Chainguard Containers include:

* Minimal design, without unnecessary software bloat
* Daily builds to ensure container images are up-to-date with available security patches
* [High quality build-time SBOMs](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/?utm_source=readmes) attesting to the provenance of all artifacts within the image
* [Verifiable signatures](https://edu.chainguard.dev/chainguard/chainguard-images/working-with-images/retrieve-image-sboms/) provided by [Sigstore](https://edu.chainguard.dev/open-source/sigstore/cosign/an-introduction-to-cosign/?utm_source=readmes)
* Reproducible builds with Cosign and apko ([read more about reproducibility](https://www.chainguard.dev/unchained/reproducing-chainguards-reproducible-image-builds?utm_source=readmes))

For cases where you need container images with shells and package managers to build or debug, most Chainguard Containers come paired with [a *development*, or `-dev`, variant](https://edu.chainguard.dev/chainguard/chainguard-images/about/differences-development-production/).

In all other cases, including Chainguard Containers tagged as `:latest` or with a specific version number, the container images include only an open-source application and its runtime dependencies. These minimal container images typically do not contain a shell or package manager.

Although the `-dev` container image variants have similar security features as their more minimal versions, they include additional software that is typically not necessary in production environments. We recommend using multi-stage builds to copy artifacts from the `-dev` variant into a more minimal production image.

## Need additional packages?

To improve security, Chainguard Containers include only essential dependencies. Need more packages? Chainguard customers can use [Custom Assembly](https://edu.chainguard.dev/chainguard/chainguard-images/features/ca-docs/custom-assembly/) to add packages, either through the Console, `chainctl`, or API.

To use Custom Assembly in the Chainguard Console: navigate to the image you'd like to customize in [your Organization's list of images](https://console.chainguard.dev/images/organization), and click on the **Customize image** button at the top of the page.

## Learn More

Refer to our Chainguard Containers documentation on [Chainguard Academy](https://edu.chainguard.dev/?utm_source=readmes). Chainguard also offers [VMs](https://www.chainguard.dev/vms?utm_source=readmes) and [Libraries](https://www.chainguard.dev/libraries?utm_source=readmes) — [contact us](https://www.chainguard.dev/contact?utm_source=readmes) for access.
 

## Trademarks

_This software listing is packaged by Chainguard. The trademarks set forth in this offering are owned by their respective companies, and use of them does not imply any affiliation, sponsorship, or endorsement by such companies._