locals {
  # This is adapted from the upstream values.yaml to replace all of the constituent images.
  values = <<EOF
  # Fulcio
  fulcio:
    enabled: true
    namespace:
      name: fulcio-system
      create: true
    forceNamespace: fulcio-system
    server:
      fullnameOverride: fulcio-server
      image:
        registry: ${data.oci_string.images["fulcio-server"].registry}
        repository: ${data.oci_string.images["fulcio-server"].repo}
        version: ${data.oci_string.images["fulcio-server"].digest}
    createcerts:
      fullnameOverride: fulcio-createcerts
      image:
        registry: ${data.oci_string.images["fulcio-createcerts"].registry}
        repository: ${data.oci_string.images["fulcio-createcerts"].repo}
        version: ${data.oci_string.images["fulcio-createcerts"].digest}
    ctlog:
      enabled: false
      createctconfig:
        logPrefix: sigstorescaffolding

  # CTLog
  ctlog:
    enabled: true
    namespace:
      name: ctlog-system
      create: true
    forceNamespace: ctlog-system
    fullnameOverride: ctlog
    createcerts:
      fullnameOverride: ctlog-createcerts
    createctconfig:
      image:
        registry: ${data.oci_string.images["ctlog-createctconfig"].registry}
        repository: ${data.oci_string.images["ctlog-createctconfig"].repo}
        version: ${data.oci_string.images["ctlog-createctconfig"].digest}
      initContainerImage:
        curl:
          registry: ${data.oci_string.images["curl"].registry}
          repository: ${data.oci_string.images["curl"].repo}
          version: ${data.oci_string.images["curl"].digest}
    createtree:
      fullnameOverride: ctlog-createtree
      displayName: ctlog-tree
      image:
        registry: ${data.oci_string.images["trillian-createtree"].registry}
        repository: ${data.oci_string.images["trillian-createtree"].repo}
        version: ${data.oci_string.images["trillian-createtree"].digest}
    server:
      image:
        registry: ${data.oci_string.images["ctlog-server"].registry}
        repository: ${data.oci_string.images["ctlog-server"].repo}
        version: ${data.oci_string.images["ctlog-server"].digest}

  # Rekor
  rekor:
    enabled: true
    namespace:
      name: rekor-system
      create: true
    forceNamespace: rekor-system
    fullnameOverride: rekor
    initContainerImage:
      curl:
        registry: ${data.oci_string.images["curl"].registry}
        repository: ${data.oci_string.images["curl"].repo}
        version: ${data.oci_string.images["curl"].digest}
    backfillredis:
      image:
        registry: ${data.oci_string.images["backfill-redis"].registry}
        repository: ${data.oci_string.images["backfill-redis"].repo}
        version: ${data.oci_string.images["backfill-redis"].digest}
    createtree:
      image:
        registry: ${data.oci_string.images["trillian-createtree"].registry}
        repository: ${data.oci_string.images["trillian-createtree"].repo}
        version: ${data.oci_string.images["trillian-createtree"].digest}
    server:
      fullnameOverride: rekor-server
      image:
        registry: ${data.oci_string.images["rekor-server"].registry}
        repository: ${data.oci_string.images["rekor-server"].repo}
        version: ${data.oci_string.images["rekor-server"].digest}
    redis:
      fullnameOverride: rekor-redis
      image:
        registry: ${data.oci_string.images["redis"].registry}
        repository: ${data.oci_string.images["redis"].repo}
        version: ${data.oci_string.images["redis"].digest}
    trillian:
      enabled: false

  # Trillian
  trillian:
    enabled: true
    namespace:
      name: trillian-system
      create: true
    forceNamespace: trillian-system
    fullnameOverride: trillian
    createdb:
      image:
        registry: ${data.oci_string.images["trillian-createdb"].registry}
        repository: ${data.oci_string.images["trillian-createdb"].repo}
        version: ${data.oci_string.images["trillian-createdb"].digest}
    mysql:
      image:
        registry: ${data.oci_string.images["mysql"].registry}
        repository: ${data.oci_string.images["mysql"].repo}
        version: ${data.oci_string.images["mysql"].digest}
    initContainerImage:
      curl:
        registry: ${data.oci_string.images["curl"].registry}
        repository: ${data.oci_string.images["curl"].repo}
        version: ${data.oci_string.images["curl"].digest}
      netcat:
        registry: ${data.oci_string.images["netcat"].registry}
        repository: ${data.oci_string.images["netcat"].repo}
        version: ${data.oci_string.images["netcat"].digest}
    logServer:
      name: trillian-logserver
      fullnameOverride: trillian-logserver
      portHTTP: 8090
      portRPC: 8091
      image:
        registry: ${data.oci_string.images["logserver"].registry}
        repository: ${data.oci_string.images["logserver"].repo}
        version: ${data.oci_string.images["logserver"].digest}
    logSigner:
      name: trillian-logsigner
      fullnameOverride: trillian-logsigner
      image:
        registry: ${data.oci_string.images["logsigner"].registry}
        repository: ${data.oci_string.images["logsigner"].repo}
        version: ${data.oci_string.images["logsigner"].digest}
    mysql:
      fullnameOverride: trillian-mysql

  tuf:
    enabled: true
    namespace:
      name: tuf-system
      create: true
    forceNamespace: tuf-system
    fullnameOverride: tuf
    deployment:
      registry: ${data.oci_string.images["tuf-server"].registry}
      repository: ${data.oci_string.images["tuf-server"].repo}
      version: ${data.oci_string.images["tuf-server"].digest}

    secrets:
      rekor:
        name: rekor-public-key
        path: rekor-pubkey
      fulcio:
        name: fulcio-server-secret
        path: fulcio-cert
      ctlog:
        name: ctlog-public-key
        # This works around a problem where "cosign initialize"
        # cannot handle the TUF root without the file matching
        # this name.
        path: ctfe.pub

  copySecretJob:
    enabled: true
    name: copy-secrets-job
    registry: docker.io
    repository: alpine/k8s
    version: sha256:fb0d2db81fb0f98abb1adf5246d6f0f4d19f34031afe4759cb7ad8e2eb8d2c01
    imagePullPolicy: IfNotPresent
    serviceaccount: tuf-secret-copy-job
    backoffLimit: 6

  tsa:
    enabled: true
    namespace:
      create: true
    server:
      args:
        signer: memory
      image:
        registry: ${data.oci_string.images["tsa-server"].registry}
        repository: ${data.oci_string.images["tsa-server"].repo}
        version: ${data.oci_string.images["tsa-server"].digest}
  EOF
}
