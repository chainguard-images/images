//go:build e2e
// +build e2e

package test

import (
	"fmt"
	"os"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	ts "github.com/gruntwork-io/terratest/modules/test-structure"
)

func TestK8s(t *testing.T) {
	t.Parallel()

	setupPath := "./setup/"
	defer ts.RunTestStage(t, "TEARDOWN", func() {
		terraform.Destroy(t, ts.LoadTerraformOptions(t, setupPath))
	})
	ts.RunTestStage(t, "setup", func() {
		opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{TerraformDir: setupPath})
		ts.SaveTerraformOptions(t, setupPath, opts)
		terraform.InitAndApply(t, opts)
	})
	setupOpts := ts.LoadTerraformOptions(t, setupPath)
	_ = setupOpts

	cwd, err := os.Getwd()
	if err != nil {
		t.Fatal(err)
	}
	os.Setenv("KUBE_CONFIG_PATH", fmt.Sprintf("%s/setup/kubeconfig", cwd))

	// Group tests that require a k8s cluster to exist
	t.Run("k8s", func(t *testing.T) {
		t.Run("flux", func(t *testing.T) {
			t.Parallel()

			opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
				TerraformDir: "../../flux/tests/smoke",
				Vars: map[string]interface{}{
					// TODO: Replace this with a real build once we output image digests
					"digests": map[string]interface{}{
						"cli":                         "cgr.dev/chainguard/flux@sha256:31f86ecdefb325625c4cdd1e8bbbf967a1906d83289e1ebddd80279ab5153fcc",
						"helm-controller":             "cgr.dev/chainguard/flux-helm-controller@sha256:7614aeda83856c30417ac9340a060b5a8c9515c3743ddc461aef37e1f360d1fe",
						"kustomize-controller":        "cgr.dev/chainguard/flux-kustomize-controller@sha256:87d145082f93890b36a880b80c2396c4a18ef935dddec2217a96be8b8c452a6b",
						"notification-controller":     "cgr.dev/chainguard/flux-notification-controller@sha256:728e954d2f7ef542f020a9428ee247ffc5df11127e774a3895ca2752b6119d82",
						"source-controller":           "cgr.dev/chainguard/flux-source-controller@sha256:4075119438f7127af643c195aee67bb37990bdfac446eac0cf1e48d06d1e42e0",
						"image-automation-controller": "cgr.dev/chainguard/flux-image-automation-controller@sha256:f5ad2c74ecf64cf6a3a6b0296d4e4e1c6d851e1fd173602b100982e41d2c7067",
						"image-reflector-controller":  "cgr.dev/chainguard/flux-image-reflector-controller@sha256:62604a095360bd9562a9fc1e36b48afe7cf58a9dcdef1d5189f00042fba98386",
					},
				},
			})

			cleanup := up(t, opts)
			defer cleanup()

			t.Run("should be able to do flux things", func(t *testing.T) {
				cleanup := up(t, terraform.WithDefaultRetryableErrors(t, &terraform.Options{
					TerraformDir: "../../flux/tests/e2e",
				}))
				defer cleanup()
			})
		})

		t.Run("argocd", func(t *testing.T) {
			t.Parallel()

			opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
				TerraformDir: "../../argocd/tests/smoke",
				Vars: map[string]interface{}{
					"digests": map[string]interface{}{
						"argocd":      "cgr.dev/chainguard/argocd@sha256:7e3ba4657d31f3d1aacb863059cebe737f6e9a0db4107f6067b0e0f2f1543666",
						"repo-server": "cgr.dev/chainguard/argocd-repo-server@sha256:e63b02107bd6a7c785b0bf9380223c0775a8785db84904c529deeef605c06aa7",
					},
				},
			})

			cleanup := up(t, opts)
			defer cleanup()

			t.Run("should be able to do argo things", func(t *testing.T) {
				cleanup := up(t, terraform.WithDefaultRetryableErrors(t, &terraform.Options{
					TerraformDir: "../../argocd/tests/e2e",
				}))
				defer cleanup()
			})
		})

		t.Run("kyverno", func(t *testing.T) {
			t.Parallel()
		})

		t.Run("gatekeeper", func(t *testing.T) {
			t.Parallel()
		})

		t.Run("cert-manager", func(t *testing.T) {
			t.Parallel()
		})

		t.Run("external-dns", func(t *testing.T) {
			t.Parallel()
		})

		t.Run("grafana", func(t *testing.T) {
			t.Parallel()
		})
	})
}

// Calico needs a cluster without a CNI, so we use a different setup here
func TestCalico(t *testing.T) {
	t.Parallel()
}

func up(t *testing.T, opts *terraform.Options) func() error {
	_, err := terraform.InitAndApplyE(t, opts)
	if err != nil {
		// Purposely keep things around, it's useful for debugging
		t.Fatalf("Failed to apply terraform: %s", err)
	}

	return func() error {
		if os.Getenv("SKIP_TEARDOWN") != "" {
			return nil
		}
		_, err := terraform.DestroyE(t, opts)
		return err
	}
}
