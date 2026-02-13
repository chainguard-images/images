terraform {
  required_providers {
    oci       = { source = "chainguard-dev/oci" }
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "digest" {
  description = "The image digest to run tests over."
}

data "imagetest_inventory" "this" {}

resource "imagetest_harness_docker" "this" {
  name      = "hollywood"
  inventory = data.imagetest_inventory.this

  envs = {
    "IMAGE_NAME" : var.digest
  }
}

resource "imagetest_feature" "docker" {
  name    = "Test hollywood"
  harness = imagetest_harness_docker.this

  steps = [
    {
      name = "verify /bin/sh exists (required by byobu)"
      cmd  = <<EOF
        docker run --rm --entrypoint /bin/sh $IMAGE_NAME -c "echo ok"
      EOF
    },
    {
      name = "verify core binaries are installed"
      cmd  = <<EOF
        docker run --rm --entrypoint /bin/bash $IMAGE_NAME -c "
          set -e
          for cmd in hollywood byobu tmux cmatrix htop ccze jp2a tree atop grep sed ps; do
            command -v \$cmd > /dev/null || { echo \"MISSING: \$cmd\"; exit 1; }
          done
          echo 'All core binaries present'
        "
      EOF
    },
    {
      name = "verify hollywood script is executable with correct shebang"
      cmd  = <<EOF
        docker run --rm --entrypoint /bin/bash $IMAGE_NAME -c "
          set -e
          test -x /usr/bin/hollywood || { echo 'hollywood not executable'; exit 1; }
          head -1 /usr/bin/hollywood | grep -q '#!/bin/bash' || { echo 'wrong shebang'; exit 1; }
        "
      EOF
    },
    {
      name = "verify hollywood widget scripts are present"
      cmd  = <<EOF
        docker run --rm --entrypoint /bin/bash $IMAGE_NAME -c "
          set -e
          test -d /usr/lib/hollywood || { echo 'widget dir missing'; exit 1; }
          count=\$(ls /usr/lib/hollywood/ | wc -l)
          test \$count -gt 0 || { echo 'no widget scripts found'; exit 1; }
          echo \"Found \$count widget scripts\"
          ls /usr/lib/hollywood/
        "
      EOF
    },
    {
      name = "verify tmux and byobu versions"
      cmd  = <<EOF
        docker run --rm --entrypoint /bin/bash $IMAGE_NAME -c "
          set -e
          tmux -V
          head -1 /usr/bin/byobu | grep -q '/bin/sh' || { echo 'byobu shebang wrong'; exit 1; }
        "
      EOF
    },
    {
      name = "verify widget binaries are functional"
      cmd  = <<EOF
        docker run --rm --entrypoint /bin/bash $IMAGE_NAME -c "
          set -e
          cmatrix -V 2>&1 | head -1
          htop --version | head -1
          tree --version | head -1
          ccze --version 2>&1 | head -1
          jp2a --version 2>&1 | head -1
          echo 'All widget binaries functional'
        "
      EOF
    },
    {
      name = "verify image runs as nonroot"
      cmd  = <<EOF
        docker run --rm --entrypoint /bin/bash $IMAGE_NAME -c "
          set -e
          uid=\$(id -u)
          test \$uid -eq 65532 || { echo \"Expected UID 65532, got \$uid\"; exit 1; }
          echo \"Running as UID \$uid (nonroot)\"
        "
      EOF
    },
    {
      name = "verify hollywood runs with tmux and widget processes"
      cmd  = <<EOF
        # Start hollywood in the background with a pseudo-TTY
        docker run -dt --name hollywood-test $IMAGE_NAME
        trap "docker rm -f hollywood-test" EXIT

        # Wait for hollywood to start and spawn widget panes
        sleep 15

        # Verify the container is still running
        status=$(docker inspect hollywood-test --format '{{.State.Status}}')
        if [ "$status" != "running" ]; then
          echo "FAIL: container is not running (status: $status)"
          docker logs hollywood-test
          exit 1
        fi

        # Capture the process list
        procs=$(docker exec hollywood-test ps aux)
        echo "$procs"

        # Verify tmux is running
        echo "$procs" | grep -q "[t]mux" || { echo "FAIL: tmux not running"; exit 1; }
        echo "PASS: tmux is running"

        # Verify byobu tmuxrc is loaded (byobu wraps tmux with its config)
        echo "$procs" | grep -q "byobu" || { echo "FAIL: byobu not running"; exit 1; }
        echo "PASS: byobu is running"

        # Verify the hollywood script itself is running
        echo "$procs" | grep -q "[h]ollywood" || { echo "FAIL: hollywood not running"; exit 1; }
        echo "PASS: hollywood is running"

        # Verify at least one widget process is running from /usr/lib/hollywood/
        echo "$procs" | grep -q "lib/hollywood/" || { echo "FAIL: no widget processes running"; exit 1; }
        widget_count=$(echo "$procs" | grep -c "lib/hollywood/")
        echo "PASS: $widget_count widget processes running"
      EOF
    },
  ]
}
