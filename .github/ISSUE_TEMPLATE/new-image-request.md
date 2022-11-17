name: New Chainguard Images Request
description: Use this form to request a new kind of [Chainguard Image](github.com/chainguard-images/)
title: "[Image Request]: $IMAGE_NAME"
labels: ["image-request", "needs-triage"]
assignees:
- amouat
body:
  - type: textarea
    id: image-description
    attributes:
      label: "What software would you like us to add to our image catalog? (one per issue please)"
    validations:
      required: true
  - type: input
    id: image-versions
    attributes:
      label: "which versions of the containerized software do you need?"
  - type: textarea
    id: image-justification
    attributes:
      label: "Add some justification for why this specific image and versions are important."
