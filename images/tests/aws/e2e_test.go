//go:build e2e
// +build e2e

package test

import (
	"fmt"
	"os"
	"strings"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	ts "github.com/gruntwork-io/terratest/modules/test-structure"
)

func TestAws(t *testing.T) {
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

	cwd, err := os.Getwd()
	if err != nil {
		t.Fatal(err)
	}
	os.Setenv("KUBE_CONFIG_PATH", fmt.Sprintf("%s/setup/kubeconfig", cwd))

	// Group tests that require an EKS cluster to exists
	t.Run("eks", func(t *testing.T) {
		t.Run("aws-load-balancer-controller", func(t *testing.T) {
			t.Parallel()

			opts := &terraform.Options{
				TerraformDir: "../../aws-load-balancer-controller/e2e",
				Vars: map[string]interface{}{
					"name":                      terraform.Output(t, setupOpts, "name"),
					"cluster_name":              terraform.Output(t, setupOpts, "cluster_name"),
					"cluster_oidc_provider_arn": terraform.Output(t, setupOpts, "cluster_oidc_provider_arn"),
					"public_subnets":            terraform.OutputList(t, setupOpts, "public_subnets"),
					"private_subnets":           terraform.OutputList(t, setupOpts, "private_subnets"),
					// TODO: This can be replaced with an actual image build once we plumb outputs through
					"image_ref": "cgr.dev/chainguard/aws-load-balancer-controller:latest",
				},
			}

			cleanup := up(t, opts)
			if err != nil {
				t.Fatalf("Failed to create ALB: %s", err)
			}
			defer cleanup()

			t.Run("should have a valid ALB", func(t *testing.T) {
				albHostname := terraform.Output(t, opts, "alb_hostname")
				if !strings.HasSuffix(albHostname, ".elb.amazonaws.com") {
					t.Fatalf("Expected ALB hostname to end with .elb.amazonaws.com, got %s", albHostname)
				}
			})
		})

		t.Run("aws-ebs-csi-driver", func(t *testing.T) {
			t.Parallel()

			opts := &terraform.Options{
				TerraformDir: "../../aws-ebs-csi-driver/e2e",
				Vars: map[string]interface{}{
					"name":                      terraform.Output(t, setupOpts, "name"),
					"cluster_oidc_provider_arn": terraform.Output(t, setupOpts, "cluster_oidc_provider_arn"),
					// TODO: This can be replaced with an actual image build once we plumb outputs through
					"image_ref": "cgr.dev/chainguard/aws-ebs-csi-driver:latest",
				},
			}

			cleanup := up(t, opts)
			if err != nil {
				t.Fatalf("Failed to create EBS CSI driver: %s", err)
			}
			defer cleanup()

			t.Run("pods should be writing to a pvc", func(t *testing.T) {
				// TODO: Placeholder idea
			})
		})

		t.Run("aws-efs-csi-driver", func(t *testing.T) {
			t.Parallel()

			opts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
				TerraformDir: "../../aws-efs-csi-driver/e2e",
				Vars: map[string]interface{}{
					"vpc_id":                    terraform.Output(t, setupOpts, "vpc_id"),
					"private_subnets":           terraform.OutputList(t, setupOpts, "private_subnets"),
					"cluster_oidc_provider_arn": terraform.Output(t, setupOpts, "cluster_oidc_provider_arn"),
				},
			})

			cleanup := up(t, opts)
			if err != nil {
				t.Fatalf("Failed to create EFS CSI driver: %s", err)
			}
			defer cleanup()

			t.Run("pods should be writing to a shared pvc", func(t *testing.T) {
				// TODO: Placeholder
			})
		})
	})
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
