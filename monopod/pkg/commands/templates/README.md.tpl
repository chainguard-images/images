<!--monopod:start-->
# {{ .Name }}
| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/{{ .Name }}` |


* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/{{ .Name }}/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*

---
<!--monopod:end-->

<!--overview:start-->
{{ .ShortDesc }}
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/{{ .Name }}:latest
```
<!--getting:end-->
{{ if .CompatNotes }}
<!--compatibility:start-->
## Compatibility Notes

{{ .CompatNotes }}
<!--compatibility:end-->
{{ end }}
<!--body:start-->
{{- .Body -}}
<!--body:end-->
