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
        registry: ${local.parsed["fulcio-server"].registry}
        repository: ${local.parsed["fulcio-server"].repo}
        version: ${local.parsed["fulcio-server"].digest}
    createcerts:
      fullnameOverride: fulcio-createcerts
      image:
        registry: ${local.parsed["fulcio-createcerts"].registry}
        repository: ${local.parsed["fulcio-createcerts"].repo}
        version: ${local.parsed["fulcio-createcerts"].digest}
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
        registry: ${local.parsed["ctlog-createctconfig"].registry}
        repository: ${local.parsed["ctlog-createctconfig"].repo}
        version: ${local.parsed["ctlog-createctconfig"].digest}
      initContainerImage:
        curl:
          registry: ${local.parsed["curl"].registry}
          repository: ${local.parsed["curl"].repo}
          version: ${local.parsed["curl"].digest}
    createtree:
      fullnameOverride: ctlog-createtree
      displayName: ctlog-tree
      image:
        registry: ${local.parsed["trillian-createtree"].registry}
        repository: ${local.parsed["trillian-createtree"].repo}
        version: ${local.parsed["trillian-createtree"].digest}
    server:
      image:
        registry: ${local.parsed["ctlog-server"].registry}
        repository: ${local.parsed["ctlog-server"].repo}
        version: ${local.parsed["ctlog-server"].digest}

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
        registry: ${local.parsed["curl"].registry}
        repository: ${local.parsed["curl"].repo}
        version: ${local.parsed["curl"].digest}
    backfillredis:
      image:
        registry: ${local.parsed["backfill-redis"].registry}
        repository: ${local.parsed["backfill-redis"].repo}
        version: ${local.parsed["backfill-redis"].digest}
    createtree:
      image:
        registry: ${local.parsed["trillian-createtree"].registry}
        repository: ${local.parsed["trillian-createtree"].repo}
        version: ${local.parsed["trillian-createtree"].digest}
    server:
      fullnameOverride: rekor-server
      image:
        registry: ${local.parsed["rekor-server"].registry}
        repository: ${local.parsed["rekor-server"].repo}
        version: ${local.parsed["rekor-server"].digest}
    redis:
      fullnameOverride: rekor-redis
      image:
        registry: ${local.parsed["redis"].registry}
        repository: ${local.parsed["redis"].repo}
        version: ${local.parsed["redis"].digest}
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
        registry: ${local.parsed["trillian-createdb"].registry}
        repository: ${local.parsed["trillian-createdb"].repo}
        version: ${local.parsed["trillian-createdb"].digest}
    mysql:
      image:
        registry: ${local.parsed["mysql"].registry}
        repository: ${local.parsed["mysql"].repo}
        version: ${local.parsed["mysql"].digest}
    initContainerImage:
      curl:
        registry: ${local.parsed["curl"].registry}
        repository: ${local.parsed["curl"].repo}
        version: ${local.parsed["curl"].digest}
      netcat:
        registry: ${local.parsed["netcat"].registry}
        repository: ${local.parsed["netcat"].repo}
        version: ${local.parsed["netcat"].digest}
    logServer:
      name: trillian-logserver
      fullnameOverride: trillian-logserver
      portHTTP: 8090
      portRPC: 8091
      image:
        registry: ${local.parsed["logserver"].registry}
        repository: ${local.parsed["logserver"].repo}
        version: ${local.parsed["logserver"].digest}
    logSigner:
      name: trillian-logsigner
      fullnameOverride: trillian-logsigner
      image:
        registry: ${local.parsed["logsigner"].registry}
        repository: ${local.parsed["logsigner"].repo}
        version: ${local.parsed["logsigner"].digest}
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
      registry: ${local.parsed["tuf-server"].registry}
      repository: ${local.parsed["tuf-server"].repo}
      version: ${local.parsed["tuf-server"].digest}

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
        creds: "dummycredentials" # TODO: priyawadhwa: the upstream chart requires this, priya to remove the requirement upstream
      image:
        registry: ${local.parsed["tsa-server"].registry}
        repository: ${local.parsed["tsa-server"].repo}
        version: ${local.parsed["tsa-server"].digest}
  EOF
}
