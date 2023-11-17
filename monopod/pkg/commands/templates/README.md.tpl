<!--monopod:start-->
# {{ .Readme.Name }}

<!--url:start-->
<a href="{{ .Readme.URL }}">
<!--logo:start-->
  <img src="https://storage.googleapis.com/chainguard-academy/logos/{{ .Readme.Name }}/logo.svg" width="36px" height="36px" />
<!--logo:end-->
</a>
<!--url:end-->

| | |
| - | - |
| **OCI Reference** | `cgr.dev/chainguard/{{ .Readme.Name }}` |

* [View Image in Chainguard Academy](https://edu.chainguard.dev/chainguard/chainguard-images/reference/{{ .Readme.Name }}/overview/)
* [View Image Catalog](https://console.enforce.dev/images/catalog) for a full list of available tags.
* [Contact Chainguard](https://www.chainguard.dev/chainguard-images) for enterprise support, SLAs, and access to older tags.*
---
<!--monopod:end-->

<!--overview:start-->
{{ .Readme.ShortDesc }}
<!--overview:end-->

<!--getting:start-->
## Get It!
The image is available on `cgr.dev`:

```
docker pull cgr.dev/chainguard/{{ .Readme.Name }}:latest
```
<!--getting:end-->
{{ if .Readme.CompatNotes }}
<!--compatibility:start-->
## Compatibility Notes

{{- .Readme.CompatNotes -}}
<!--compatibility:end-->
{{ end }}
<!--body:start-->
{{- .Readme.Body -}}
<!--body:end-->

