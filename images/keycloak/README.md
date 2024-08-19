<!--monopod:start-->
# keycloak
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/keycloak` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/keycloak/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Minimalist Wolfi-based [Keycloak](https://www.keycloak.org/) image for identity and access management.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/keycloak:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

### Docker

Launch a development instance of Keycloak:

```bash
docker run --name local-keycloak -p 8080:8080 \
	-e KEYCLOAK_ADMIN=admin -e KEYCLOAK_ADMIN_PASSWORD=change_me \
	cgr.dev/chainguard/keycloak:latest \
	start-dev
```

The Keycloak UI can be accessed via:
- [http://localhost:8080/](http://localhost:8080)

To launch a production instance of Keycloak, refer to the examples in the
[following documentation](https://github.com/keycloak/keycloak/blob/main/docs/guides/server/containers.adoc),
as this is dependent on environment-specific settings and customizations.

### Kubernetes operator

To deploy Keycloak leveraging the Keycloak operator, refer to the documentation
for our [Keycloak operator image](https://images.chainguard.dev/directory/image/keycloak-operator).

### Customizing the image

Keycloak provides a mechanism to configure and customize the image. This process
is outlined in the [Keycloak image documentation](https://github.com/keycloak/keycloak/blob/main/docs/guides/server/containers.adoc).

There are subtle differences in the executable paths used in the Chainguard
image. Below is the example copied from the documentation, updated with the
correct paths:

```bash
FROM cgr.dev/chainguard/keycloak:latest as builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=postgres

WORKDIR /usr/share/java/keycloak
# for demonstration purposes only, please make sure to use proper certificates in production instead
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore
RUN /usr/share/java/keycloak/bin/kc.sh build

FROM cgr.dev/chainguard/keycloak:latest
COPY --from=builder /usr/share/java/keycloak/ /usr/share/java/keycloak/

# change these values to point to a running postgres instance
ENV KC_DB=postgres
ENV KC_DB_URL=<DBURL>
ENV KC_DB_USERNAME=<DBUSERNAME>
ENV KC_DB_PASSWORD=<DBPASSWORD>
ENV KC_HOSTNAME=localhost
ENTRYPOINT ["/usr/share/java/keycloak/bin/kc.sh"]
```
<!--body:end-->
