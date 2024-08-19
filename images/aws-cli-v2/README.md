<!--monopod:start-->
# aws-cli-v2
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/aws-cli-v2` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/aws-cli-v2/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimal [aws-cli v2](https://github.com/aws/aws-cli/tree/v2) container image.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/aws-cli-v2:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Before using the aws-cli Chainguard Image, you need to configure your [AWS credentials](https://github.com/aws/aws-cli/tree/v2#getting-started). There are a number of ways you can do this, so we encourage you to review the official [AWS credentials documentation](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html#configure-precedence) to determine what method works best for you.

AWS credentials and configurations are typically stored in a directory named `.aws`. Assuming you've already set up your AWS credentials locally, you can share them from your host machine to a container by mounting this directory as a volume. The following command follows this method to pass along AWS credentials in order to retrieve a list of EKS clusters: 

```shell
docker run --rm -it -v ~/.aws:/home/nonroot/.aws:ro cgr.dev/chainguard/aws-cli-v2:latest s3 ls
```

Note that Chainguard's aws-cli Image has a single user `nonroot` with uid `65532`, belonging to gid `65532`.; the previous command mounts the local `.aws` directory under this user's home directory. Be aware that if you follow this method you may need to adjust the permissions of your local credentials file in order for the container to be able to read it.

You can get help with any command when using the AWS Command Line Interface (AWS CLI) by following any command name with `help`. For example, the following command displays help for the general AWS CLI options and the available top-level commands:

```shell
docker run --rm cgr.dev/chainguard/aws-cli-v2:latest help
```

The following command displays help information for the `aws ec2 run-instances` command:

```shell
docker run --rm cgr.dev/chainguard/aws-cli-v2:latest ec2 run-instances help
```

Please refer to the official [Getting Started](https://docs.aws.amazon.com/cli/latest/userguide/cli-usage-help.html) guide for more information.
<!--body:end-->
