<!--monopod:start-->
# teleport
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/teleport` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/teleport/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Teleport is an access management platform designed to provide secure and unified access to various infrastructure resources such as SSH, Kubernetes clusters, databases, and web applications
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/teleport:latest
```
<!--getting:end-->

<!--body:start-->

## Usage

There are several ways of installing and configuring Teleport. To access the whole available installation methods and configurations, visit the [Teleport Installation documentation](https://goteleport.com/docs/installation/).

For example this guide shows how to run Teleport in a Docker container: https://goteleport.com/docs/installation/#example-of-running-a-teleport-container

1. Run teleport configure from the Teleport container to generate a configuration file. This sets the container's name to localhost so your browser can trust the Proxy Service's self-signed TLS certificate:

```bash
docker run --hostname localhost --rm \
  --entrypoint=/usr/local/bin/teleport \
  cgr.dev/chainguard/teleport:latest configure --roles=proxy,auth > ~/teleport/config/teleport.yaml
```

2. Start the Teleport container:

```bash
docker run --hostname localhost --name teleport \
  -v ~/teleport/config:/etc/teleport \
  -v ~/teleport/data:/var/lib/teleport \
  -p 3025:3025 -p 3080:3080 \
  cgr.dev/chainguard/teleport:latest
```

3. From there, open another terminal and make sure your Teleport container's web API is functioning as intended:

```bash
curl --insecure https://localhost:3080/webapi/ping
```

You should see JSON output similar to the following:

```json
{
  "auth": {
    "type": "local",
    "second_factor": "otp",
    "preferred_local_mfa": "otp",
    "local": {
      "name": ""
    },
    "private_key_policy": "none",
    "device_trust_disabled": true,
    "has_motd": false
  },
  "proxy": {
    "kube": {
      "enabled": true,
      "listen_addr": "0.0.0.0:3080"
    },
    "ssh": {
      "listen_addr": "0.0.0.0:3080",
      "tunnel_listen_addr": "0.0.0.0:3080",
      "web_listen_addr": "0.0.0.0:3080"
    },
    "db": {
      "postgres_listen_addr": "0.0.0.0:3080",
      "mysql_listen_addr": "0.0.0.0:3080"
    },
    "tls_routing_enabled": true
  },
  "server_version": "12.1.5",
  "min_client_version": "11.0.0",
  "cluster_name": "localhost",
  "automatic_upgrades": false
}
```

Also you could install Teleport on Kubernetes using Helm. For more information, visit the [Teleport Helm Chart documentation](https://goteleport.com/docs/deploy-a-cluster/helm-deployments/kubernetes-cluster/).

All you need to do is to add the Helm repository and install the Teleport Helm chart:

```bash
helm repo add teleport https://charts.releases.teleport.dev
helm repo update
```

Then install the Teleport Helm chart:

```bash
helm install teleport-cluster teleport/teleport-cluster \
  --create-namespace \
  --version 15.4.0 \
  --set image=cgr.dev/chainguard/teleport
```

> Note: As Chainguard provides only :latest tag for public images you cannot use the :latest tag for `teleportVersionOverride` variable as its only accepts semver type of version number. 
> Due to that limitation you should clone this image with semver tag and use it in the helm install command.
> https://github.com/gravitational/teleport/blob/1e92d5e90223fc69ca75d00da4c350808dc56c2a/examples/chart/teleport-cluster/charts/teleport-operator/templates/_helpers.tpl#L38-L40
> Or you could use helm --version X for Teleport version.

<!--body:end-->
