variables {
  project = "img-test-infra-f2ea"
  region  = "us-central1"
  zone    = "us-central1-a"
}

run "execute" {
  # Empty means just run the module with defaults

  assert {
    condition     = output.connection.docker.host != ""
    error_message = "Expected connection.docker.host to be set"
  }

  assert {
    condition     = startswith(output.connection.docker.host, "ssh://")
    error_message = "Expected connection.docker.host to start with ssh://"
  }
}

run "verify" {
  module {
    source = "./tests/verify"
  }

  variables {
    instance_name = run.execute.instance_name
    container_id  = run.execute.connection.docker.cid
  }
}
