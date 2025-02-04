terraform {
  required_providers {
    imagetest = { source = "chainguard-dev/imagetest" }
  }
}

variable "test_repository" {
  description = "The docker repo root to use for sourcing test images."
}

variable "digest" {
  description = "The image digest to run tests over."
  type        = string
}

data "imagetest_inventory" "inventory_image" {
}

resource "random_pet" "suffix" {
}

resource "imagetest_harness_docker" "image" {
  envs = {
    IMAGE_NAME : var.digest
    RANDOM_SUFFIX : random_pet.suffix.id
  }
  inventory = data.imagetest_inventory.inventory_image
  mounts = [
    {
      source      = path.module
      destination = "/tests"
    }
  ]
  name = "docker"
}

resource "imagetest_feature" "test-sock-mount" {
  harness = imagetest_harness_docker.image
  name    = "docker-test"
  steps = [
    {
      name = "run version test"
      cmd  = <<EOF
      docker run --rm -v /var/run/docker.sock:/var/run/docker.sock $IMAGE_NAME version
EOF
    },
    {
      name = "build busybox image inside dind"
      cmd  = <<EOF
          docker run --rm -v /var/run/docker.sock:/var/run/docker.sock $IMAGE_NAME sh -c 'echo -e "FROM busybox\nCMD [\"echo\", \"Hello from BusyBox\"]" > Dockerfile && docker build -t my-busybox-image . && docker run --rm my-busybox-image' > testing-notes
          cat testing-notes | grep -i busybox
      EOF
    },
    {
      name = "run containers inside dind environment"
      cmd  = <<EOF
          docker run --rm -v /var/run/docker.sock:/var/run/docker.sock $IMAGE_NAME sh -c 'docker run --rm cgr.dev/chainguard/busybox echo hello' | grep -i hello
          docker run --rm -v /var/run/docker.sock:/var/run/docker.sock $IMAGE_NAME sh -c 'docker run --rm cgr.dev/chainguard/kubectl version --client=true' | grep -i version
    EOF
    },
  ]
}

resource "imagetest_feature" "test-privileged" {
  harness = imagetest_harness_docker.image
  name    = "docker-test-2"
  steps = [
    {
      name = "Run privileged containerd in the background"
      cmd  = <<EOF
      docker run --name privileged-docker-$RANDOM_SUFFIX --rm --privileged -d $IMAGE_NAME
      # Wait for Docker daemon to be ready (retry loop with timeout)
      for i in {1..10}; do
        if docker exec privileged-docker-$RANDOM_SUFFIX docker info >/dev/null 2>&1; then
          echo "Docker daemon is ready"
          break
        fi
        echo "Waiting for Docker daemon to start..."
        sleep 3
      done || { echo "Docker daemon failed to start"; exit 1; }
EOF
    },
    {
      name = "verify docker version"
      cmd  = <<EOF
      for i in {1..10}; do
        if docker exec privileged-docker-$RANDOM_SUFFIX docker info >/dev/null 2>&1; then
          echo "Docker daemon is ready"
          break
        fi
        echo "Waiting for Docker daemon to start..."
        sleep 3
      done || { echo "Docker daemon failed to start"; exit 1; }
      docker exec privileged-docker-$RANDOM_SUFFIX docker version
EOF
    },
    {
      name = "Build and run a BusyBox image, capture the image ID"
      cmd  = <<EOF
        IMAGE_ID=$(docker exec privileged-docker-$RANDOM_SUFFIX sh -c '
          echo -e "FROM busybox\nCMD [\"echo\", \"Hello from BusyBox\"]" > Dockerfile &&
          docker build -q -t my-busybox-image . &&
          docker images -q my-busybox-image
        ')
        echo "Built image ID: $IMAGE_ID"
    EOF
    },
    {
      name = "Run containers inside the Docker-in-Docker environment"
      cmd  = <<EOF
        docker exec privileged-docker-$RANDOM_SUFFIX sh -c '
          docker run --rm cgr.dev/chainguard/busybox echo hello &&
          docker run --rm cgr.dev/chainguard/kubectl version --client=true
        '
    EOF
    },
  ]
}

