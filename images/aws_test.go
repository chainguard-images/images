//go:build e2e
// +build e2e

package images_test

import (
	"bytes"
	"context"
	"fmt"
	"net/http"
	"os"
	"path"
	"path/filepath"
	"strings"
	"testing"
	"time"

	"github.com/gruntwork-io/terratest/modules/files"
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/hashicorp/go-retryablehttp"
	"sigs.k8s.io/e2e-framework/klient"

	corev1 "k8s.io/api/core/v1"
	resource "k8s.io/apimachinery/pkg/api/resource"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"sigs.k8s.io/e2e-framework/klient/k8s"
	"sigs.k8s.io/e2e-framework/klient/k8s/resources"
	"sigs.k8s.io/e2e-framework/klient/wait"
	"sigs.k8s.io/e2e-framework/klient/wait/conditions"
)

const (
	// The name of the environment variable that can be set to skip the teardown
	// phases of the tests.
	SKIP_TEARDOWN_KEY = "SKIP_TEARDOWN"
	// The directory where temporary TF files will be copied to.
	TF_TESTS_DIR = ".tests"
)

// TestEks tests things that *require* a running EKS cluster.
func TestEks(t *testing.T) {
	t.Parallel()

	eksVersions := []struct {
		name    string
		version string
	}{
		{"1-24", "1.24"},
		{"1-25", "1.25"},
		{"1-26", "1.26"},
		{"1-27", "1.27"},
	}

	subtests := []struct {
		name string
		// TODO: Fan out these for each components version as well
		test func(t *testing.T, client klient.Client, outputs map[string]interface{})
	}{
		{"aws-load-balancer-controller", func(t *testing.T, client klient.Client, outputs map[string]interface{}) {
			opt := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
				TerraformDir: "./aws-load-balancer-controller/tests/e2e",
				Vars: map[string]interface{}{
					"cluster_name":   outputs["cluster_name"],
					"iam_role_arn":   outputs["load_balancer_controller_irsa_role_arn"],
					"public_subnets": outputs["public_subnet_ids"],
				},
				EnvVars: map[string]string{
					"KUBE_CONFIG_PATH": outputs["kubeconfig_path"].(string),
				},
			})

			o := NewTerraformApplyCopy(t, opt)

			lbHostname := o["alb_hostname"].(string)
			testSvcHostname := o["podinfo_hostname"].(string)

			t.Run("should be able to access a service behind the load balancer", func(t *testing.T) {
				t.Logf("Checking for load balancer with name %s", lbHostname)
				req, err := retryablehttp.NewRequest(http.MethodGet, "http://"+lbHostname, nil)
				if err != nil {
					t.Fatalf("failed to create request: %v", err)
				}
				req.Host = testSvcHostname

				// TODO: This defaults to exponential backoff, which we don't really
				// need, but in the grand scheme of "give me eks", it's nbd
				client := retryablehttp.NewClient()
				client.RetryWaitMax = 5 * time.Minute
				client.RetryMax = 30

				resp, err := client.Do(req)
				if err != nil {
					t.Fatalf("failed to get load balancer: %v", err)
				}
				defer resp.Body.Close()

				if resp.StatusCode != http.StatusOK {
					t.Fatalf("expected status code %d, got %d", http.StatusOK, resp.StatusCode)
				}

				t.Logf("Load balancer %s is up and running", lbHostname)
			})
		}},

		{"aws-efs-csi-driver", func(t *testing.T, client klient.Client, outputs map[string]interface{}) {
			opt := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
				TerraformDir: "./aws-efs-csi-driver/tests/e2e",
				Vars: map[string]interface{}{
					"vpc_id":          outputs["vpc_id"],
					"iam_role_arn":    outputs["efs_csi_driver_irsa_role_arn"],
					"private_subnets": outputs["private_subnet_ids"],
				},
				EnvVars: map[string]string{
					"KUBE_CONFIG_PATH": outputs["kubeconfig_path"].(string),
				},
			})

			o := NewTerraformApplyCopy(t, opt)

			t.Run("should have writes from multiple sources", func(t *testing.T) {
				ssLabelSelector := "app=" + o["statefulset_name"].(string)
				pods := &corev1.PodList{}
				if err := client.Resources().List(context.TODO(), pods, resources.WithLabelSelector(ssLabelSelector)); err != nil {
					t.Fatalf("failed to list pods: %v", err)
				}

				mntPath := o["mount_path"].(string)
				cmd := []string{
					"/bin/sh", "-c",
					fmt.Sprintf("ls -1 %s | wc -l", mntPath),
				}

				pod := pods.Items[0]

				var stdout, stderr bytes.Buffer
				if err := client.Resources().ExecInPod(context.TODO(), pod.Namespace, pod.Name, pod.Spec.Containers[0].Name, cmd, &stdout, &stderr); err != nil {
					t.Fatalf("failed to exec in pod: %v", err)
				}

				fmt.Println(stdout.String())
				if stdout.String() != "3\n" {
					t.Fatalf("expected 3 writes, got %q", stdout.String())
				}
			})
		}},

		{"aws-ebs-csi-driver", func(t *testing.T, client klient.Client, outputs map[string]interface{}) {
			t.Run("should be able to resize the EBS volume", func(t *testing.T) {
				var pvc corev1.PersistentVolumeClaim
				if err := client.Resources().Get(context.TODO(), "ebs-claim-upright-locust", "default", &pvc); err != nil {
					t.Fatalf("failed to get pvc: %v", err)
				}

				if err := client.Resources().Update(context.TODO(), &pvc, func(_ *metav1.UpdateOptions) {
					t.Logf("resizing pvc %s/%s", pvc.Namespace, pvc.Name)
					pvc.Spec.Resources.Requests[corev1.ResourceStorage] = resource.MustParse("3Gi")
				}); err != nil {
					t.Fatalf("failed to resize pvc: %v", err)
				}

				t.Logf("waiting for pvc %s/%s to resize", pvc.Namespace, pvc.Name)
				if err := wait.For(conditions.New(client.Resources()).ResourceMatch(&pvc, func(object k8s.Object) bool {
					pvc := object.(*corev1.PersistentVolumeClaim)
					return pvc.Status.Capacity.Storage().Cmp(resource.MustParse("3Gi")) == 0
				}), wait.WithTimeout(2*time.Minute)); err != nil {
					t.Fatal(err)
				}
			})

			t.Run("should be able to snapshot the EBS volume", func(t *testing.T) {
			})
		}},
	}

	for _, tt := range eksVersions {
		tt := tt
		t.Run(tt.version, func(t *testing.T) {
			t.Parallel()

			// Create the EKS cluster
			outputs := NewTerraformApplyCopy(t, terraform.WithDefaultRetryableErrors(t, &terraform.Options{
				TerraformDir:  "../tflib/test-harnesses/aws/eks",
				BackendConfig: map[string]interface{}{},
				Vars: map[string]interface{}{
					"name":        "teks-" + tt.name,
					"eks_version": tt.version,
				},
			}))

			client, err := klient.NewWithKubeConfigFile(outputs["kubeconfig_path"].(string))
			if err != nil {
				t.Fatalf("failed to create client from eks kubeconfig: %v", err)
			}

			for _, st := range subtests {
				st := st
				t.Run(st.name, func(t *testing.T) {
					t.Parallel()

					st.test(t, client, outputs)
				})
			}
		})
	}
}

// NewTerraformApply applies the given terraform option and sets up the cleanup
// handlers. This should only be used for tests that do not need to run in
// parallel.
func NewTerraformApply(t *testing.T, opt *terraform.Options) map[string]interface{} {
	t.Cleanup(func() {
		if os.Getenv(SKIP_TEARDOWN_KEY) != "" {
			t.Logf("skipping teardown for test: %s in directory: %s", t.Name(), opt.TerraformDir)
			return
		}
		if _, err := terraform.DestroyE(t, terraform.WithDefaultRetryableErrors(t, opt)); err != nil {
			t.Fatalf("failed to destroy terraform: %v", err)
		}
	})

	if _, err := terraform.InitAndApplyE(t, terraform.WithDefaultRetryableErrors(t, opt)); err != nil {
		t.Fatalf("failed to apply terraform: %v", err)
	}

	output, err := terraform.OutputAllE(t, opt)
	if err != nil {
		t.Fatalf("failed to get terraform output: %v", err)
	}

	return output
}

// NewTerraformApplyCopy creates a copy of the terraform directory and applies
// it. This allows us to run multiple invocations of the same directory in
// parallel, without needing to predefine test harnesses for each permutation.
func NewTerraformApplyCopy(t *testing.T, opt *terraform.Options) map[string]interface{} {
	name := strings.NewReplacer("/", "_", "\\", "_", "\x00", "_").Replace(t.Name())

	path := path.Join(TF_TESTS_DIR, name, filepath.Base(opt.TerraformDir))
	if err := os.MkdirAll(path, 0755); err != nil {
		t.Fatalf("failed to create temporary terraform dir: %v", err)
	}

	if err := files.CopyFolderContentsWithFilter(opt.TerraformDir, path, func(path string) bool {
		if files.PathIsTerraformVersionFile(path) || files.PathIsTerraformLockFile(path) {
			return true
		}
		if files.PathContainsHiddenFileOrFolder(path) || files.PathContainsTerraformStateOrVars(path) {
			return false
		}
		return true
	}); err != nil {
		t.Fatalf("failed to copy terraform: %v", err)
	}
	t.Logf("copied terraform to: %s", path)

	// Dereference the pointer so we can safely modify it.
	nopt := *opt
	nopt.TerraformDir = path

	t.Cleanup(func() {
		if os.Getenv(SKIP_TEARDOWN_KEY) != "" {
			t.Logf("skipping teardown for test: %s in directory: %s", t.Name(), path)
			return
		}
		if t.Failed() {
			t.Logf("skipping directory cleanup for failed test: %s in directory: %s", t.Name(), path)
			return
		}
		if err := os.RemoveAll(path); err != nil {
			t.Fatalf("failed to remove temporary terraform dir: %v", err)
		}
	})

	return NewTerraformApply(t, &nopt)
}
