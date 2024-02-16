<!--monopod:start-->
# oauth2-proxy
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/oauth2-proxy` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/oauth2-proxy/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
[OAuth2 Proxy](https://oauth2-proxy.github.io/oauth2-proxy/) is a reverse proxy that provides authentication with Google, Azure, OpenID Connect and many more identity providers.
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/oauth2-proxy:latest
```
<!--getting:end-->

<!--body:start-->
## Use It!

This section provides a brief overview of how you can use Chainguard's `oauth2-proxy` Image to set up a proxy that can intercept a call to a specified endpoint. A complete end-to-end test would require a GitHub account (or an account with another OIDC Auth provider), a trusted domain, and an OAuth application; this example will be useful to test that the image works but it will not be able to verify authentication or properly redirect users.

Run the following command.

```shell
docker run --detach --name oidc-test -p 8080:8080 cgr.dev/chainguard/oauth2-proxy:latest \
  --cookie-secure=false \
  --cookie-secret=RYC2VBUYWQ6aenOkoN6jELQsrjtmwb23a7NdtrLI0ao= \
  --upstream=file:///dev/null \
  --http-address=0.0.0.0:8080 \
  --redirect-url=http://localhost:8080/oauth2/callback \
  --client-id=sample-id \
  --client-secret=sample-secret \
  --email-domain="*" \
  --provider=github \
  --scope=user:email
```

This `docker` command runs the `oauth2-proxy` Image while passing a number of configuration options to it. Most of these are sample values intended to get a working example proxy up and running. One particularly important option you should be aware of is the `--redirect-url`, which points to the OAuth application's callback URL. In order to set up an example locally, this example uses `http://localhost:8080` here.

Note that you can alternatively define these options in a configuration file or through environment variables. You can check out the [OAuth2 Proxy Overview](https://oauth2-proxy.github.io/oauth2-proxy/docs/configuration/overview/) for more details on these options.

After running this command, navigate to [`http://localhost:8080`](http://localhost:8080) in your web browser. There, you'll be presented with the OAuth2 Proxy sign-in screen.

Please refer to [the official documentation](https://oauth2-proxy.github.io/oauth2-proxy/docs/) for more information on how to work with OAuth2 Proxy.

<!--body:end-->
