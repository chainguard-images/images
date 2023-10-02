contents:
  packages: [
    # Package "{{ .PackageName }}" comes in via var.extra_packages
    # To add a version stream image, see the extra_packages variable in config/main.tf to add packages conditionally.
    # Otherwise, just add packages here.
  ]

accounts:
  groups:
    - groupname: nonroot
      gid: {{ .GroupGid }}
  users:
    - username: nonroot
      uid: {{ .UserUid }}
      gid: {{ .UserGid }}
  run-as: {{ .RunAs}}

entrypoint:
  command: {{ .Entrypoint }}
