<!--monopod:start-->
# conda
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/conda` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/conda/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
This image contains the CLI for the [Conda](https://docs.conda.io/en/latest/) programming environment.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/conda:latest
```
<!--getting:end-->

<!--body:start-->
## Use It!

This image contains the `conda` command, which can be used to create and manage conda environments, as well
as other assorted conda utilities.

The image can be run directly and sets the conda binary as the entrypoint:

```
docker run cgr.dev/chainguard/conda:latest
usage: conda [-h] [-V] command ...

conda is a tool for managing and deploying applications, environments and packages.

Options:

positional arguments:
  command
    clean             Remove unused packages and caches.
    compare           Compare packages between conda environments.
    config            Modify configuration values in .condarc. This is modeled after the git config command. Writes to the user .condarc file (/root/.condarc) by default. Use the --show-sources flag to display all identified configuration locations on your computer.
    create            Create a new conda environment from a list of specified packages.
    info              Display information about current conda install.
    init              Initialize conda for shell interaction.
    install           Installs a list of packages into a specified conda environment.
    list              List installed packages in a conda environment.
    package           Low-level conda package utility. (EXPERIMENTAL)
    remove (uninstall)
                      Remove a list of packages from a specified conda environment. Use `--all` flag to remove all packages and the environment itself.
    rename            Renames an existing environment.
    run               Run an executable in a conda environment.
    search            Search for packages and display associated information.The input is a MatchSpec, a query language for conda packages. See examples below.
    update (upgrade)  Updates conda packages to the latest compatible version.
    notices           Retrieves latest channel notifications.

options:
  -h, --help          Show this help message and exit.
  -V, --version       Show the conda version number and exit.

conda commands available from other packages (legacy):
  content-trust
  env
```

The `conda` binary and tools are in the `/opt/conda/bin` directory.
<!--body:end-->
