<!--monopod:start-->
# pulumi
| | |
| - | - |
| **Status** | stable |
| **OCI Reference** | `cgr.dev/chainguard/pulumi` |
| **Variants/Tags** | ![](https://storage.googleapis.com/chainguard-images-build-outputs/summary/pulumi.svg) |

*[Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

Minimal Pulumi Image

## Get It!

The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/pulumi:latest
```

## Usage

### Kubernetes Pod Example

In this directory, check the `examples/` folder.
You should find an example app for the following support Pulumi languages/runtimes:

- dotnet
- go
- java
- nodejs
- python
- yaml

This will show an example of using Pulumi SDKs to create an Nginx pod in
a kind cluster.

Try running these commands from this directory in the repo.

Set the desired language to the env var `TEST_LANG`:

```
export TEST_LANG=go
```

Start a kind cluster:

```
kind create cluster
```

Extract the kubeconfig, and modify it to use an internal IP:

```
KIND_IP="$(docker ps | grep kind- | awk '{print $1}' | xargs docker inspect | jq -r '.[0].NetworkSettings.Networks["kind"].IPAddress')"
KIND_PORT="$(docker ps | grep kind- | awk '{print $1}' | xargs docker inspect | jq -r '.[0].NetworkSettings.Ports["6443/tcp"][0].HostPort')"

mkdir .kube
kind get kubeconfig | sed "s|127.0.0.1:${KIND_PORT}|${KIND_IP}:6443|g" \
    > ".kube/config"
```

Create a temporary Pulumi home directory, and do a local login:

```
mkdir .pulumi
docker run --rm --network kind \
    -w "/work/examples/smoketest-${TEST_LANG}" \
    -v "${PWD}:/work" \
    -e PULUMI_HOME=/work/.pulumi \
    cgr.dev/chainguard/pulumi:latest \
    login file://.
```

Decide a unique stakc name:
```
export STACK_NAME="${TEST_LANG}-$(date +%s)"
```

Next, init a stack (for you decided language):

```
docker run --rm --network kind \
    -w "/work/examples/smoketest-${TEST_LANG}" \
    -v "${PWD}:/work" \
    -e PULUMI_HOME=/work/.pulumi \
    -e PULUMI_CONFIG_PASSPHRASE="${STACK_NAME}" \
    cgr.dev/chainguard/pulumi:latest \
    stack init --non-interactive --stack ${STACK_NAME}
```

Finally, create the stack:

```
docker run --rm --network kind \
    -w "/work/examples/smoketest-${TEST_LANG}" \
    -v "${PWD}:/work" \
    -e PULUMI_HOME=/work/.pulumi \
    -e PULUMI_CONFIG_PASSPHRASE="${STACK_NAME}" \
    -e KUBECONFIG=/work/.kube/config \
    cgr.dev/chainguard/pulumi:latest \
    up --yes --config name=${STACK_NAME}
```

You should notice a pod in the default namespace has been created:

```
$ kubectl get pods
NAME            READY   STATUS    RESTARTS   AGE
go-1683319492   1/1     Running   0          24s
```

To teardown the stack, run the following:
```
docker run --rm --network kind \
    -w "/work/examples/smoketest-${TEST_LANG}" \
    -v "${PWD}:/work" \
    -e PULUMI_HOME=/work/.pulumi \
    -e PULUMI_CONFIG_PASSPHRASE="${STACK_NAME}" \
    -e KUBECONFIG=/work/.kube/config \
    cgr.dev/chainguard/pulumi:latest \
    destroy --yes
```

Now check for pods, there should not be any:
```
$ kubectl get pods
No resources found in default namespace.
```
