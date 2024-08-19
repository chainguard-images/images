<!--monopod:start-->
# shadowsocks-rust
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/shadowsocks-rust` |


* [View Image in the Chainguard Images Directory](https://images.chainguard.dev/directory/image/shadowsocks-rust/overview).
* [View the Image Catalog](https://console.chainguard.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.

---
<!--monopod:end-->

<!--overview:start-->
Shadowsocks-rust is a Rust implementation of the Shadowsocks protocol, aimed at ensuring secure and private internet access by encrypting connections and circumventing internet restrictions.
<!--overview:end-->

<!--getting:start-->
## Download this Image
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/shadowsocks-rust:latest
```
<!--getting:end-->

<!--body:start-->
## Usage

Create a configuration file `config.json`:

```bash
cat <<EOF > config.json
{
    "server": "127.0.0.1",
    "server_port": 8388,
    "local_port": 1080,
    "local_address": "127.0.0.1",
    "password": "password",
    "timeout": 300,
    "method": "aes-256-gcm"
}
EOF
```

* Start the `sslocal`:

```bash
docker run \
  --name sslocal-rust \
  --restart always \
  -p 1080:1080/tcp \
  -v /path/to/config.json:/etc/shadowsocks-rust/config.json \
  -dit cgr.dev/chainguard/shadowsocks-rust-ssserver:latest
```

* Start the `ssserver`:

```bash
docker run \
  --name ssserver-rust \
  --restart always \
  -p 8388:8388/tcp \
  -p 8388:8388/udp \
  -v /path/to/config.json:/etc/shadowsocks-rust/config.json \
  -dit cgr.dev/chainguard/shadowsocks-rust-sslocal:latest
```

Jump to the official [Getting Started](https://github.com/shadowsocks/shadowsocks-rust?tab=readme-ov-file#getting-started) guide for more detailed usage.
<!--body:end-->
