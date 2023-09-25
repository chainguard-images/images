package commands

import (
	"strings"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestScaffoldMain(t *testing.T) {
	testCases := []struct {
		name           string
		devVariant     bool
		moduleName     string
		expectedResult string
	}{
		{
			name:       "module with dev variant",
			devVariant: true,
			moduleName: "latest",
			expectedResult: `terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" { source = "./config" }

module "latest" {
  source            = "../../tflib/publisher"
  name              = basename(path.module)
  target_repository = var.target_repository
  config            = module.latest-config.config
  build-dev         = true
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.image_ref
  tag        = "latest"
}

resource "oci_tag" "latest-dev" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.dev_ref
  tag        = "latest-dev"
}
`,
		},
		{
			name:       "module with no dev variant",
			devVariant: false,
			moduleName: "latest",
			expectedResult: `terraform {
  required_providers {
    oci = { source = "chainguard-dev/oci" }
  }
}

variable "target_repository" {
  description = "The docker repo into which the image and attestations should be published."
}

module "latest-config" { source = "./config" }

module "latest" {
  source = "../../tflib/publisher"

  name = basename(path.module)

  target_repository = var.target_repository
  config            = module.latest-config.config
}

module "test-latest" {
  source = "./tests"
  digest = module.latest.image_ref
}

resource "oci_tag" "latest" {
  depends_on = [module.test-latest]
  digest_ref = module.latest.image_ref
  tag        = "latest"
}
`,
		},
	}

	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T) {
			o := scaffoldOptions{
				TemplatesPath: "../../../images/TEMPLATE",
				ModuleName:    "latest",
				DevVariant:    tc.devVariant,
			}

			writer := strings.Builder{}

			require.NoError(t, o.scaffoldMainTerraform(&writer))
			require.Equal(t, tc.expectedResult, writer.String())
		})
	}
}

func TestScaffoldMainConfigTerraform(t *testing.T) {
	expectedResult := `terraform {
  required_providers {
    apko = { source = "chainguard-dev/apko" }
  }
}

variable "extra_packages" {
  description = "The additional packages to install"
  // TODO: Add any other packages here you want to conditionally include,
  // or update this default to [] if this isn't a version stream image.
  default = [
    "test-package",
    // Other packages your image needs
  ]
}

data "apko_config" "this" {
  config_contents = file("${path.module}/latest.apko.yaml")
  extra_packages  = var.extra_packages
}

output "config" {
  value = jsonencode(data.apko_config.this.config)
}
`

	o := scaffoldOptions{
		TemplatesPath: "../../../images/TEMPLATE",
		ModuleName:    "latest",
		PackageName:   "test-package",
	}

	writer := strings.Builder{}

	require.NoError(t, o.scaffoldMainConfigTerraform(&writer))
	require.Equal(t, expectedResult, writer.String())
}

func TestScaffoldApkoYaml(t *testing.T) {
	var (
		groupGid uint16 = 65535
		userUid  uint16 = 1
		userGid  uint16 = 1
		runAs    uint16 = 65534
	)

	testCases := []struct {
		name           string
		packageName    string
		groupGid       *uint16
		userUid        *uint16
		userGid        *uint16
		runAs          *uint16
		entrypoint     string
		expectedResult string
	}{
		{
			name:        "basic package",
			packageName: "test-package",
			entrypoint:  "/usr/bin/test-entrypoint",
			expectedResult: `contents:
  packages: [
    # Package "test-package" comes in via var.extra_packages
    # To add a version stream image, see the extra_packages variable in config/main.tf to add packages conditionally.
    # Otherwise, just add packages here.
  ]

accounts:
  groups:
    - groupname: nonroot
      gid: 65532
  users:
    - username: nonroot
      uid: 65532
      gid: 65532
  run-as: 65532

entrypoint:
  command: /usr/bin/test-entrypoint
`,
		},
		{
			name:        "package with group GID",
			packageName: "test-package",
			entrypoint:  "/usr/bin/test-entrypoint",
			groupGid:    &groupGid,
			expectedResult: `contents:
  packages: [
    # Package "test-package" comes in via var.extra_packages
    # To add a version stream image, see the extra_packages variable in config/main.tf to add packages conditionally.
    # Otherwise, just add packages here.
  ]

accounts:
  groups:
    - groupname: nonroot
      gid: 65535
  users:
    - username: nonroot
      uid: 65532
      gid: 65532
  run-as: 65532

entrypoint:
  command: /usr/bin/test-entrypoint
`,
		},
		{
			name:        "package with user uid and gid",
			packageName: "test-package",
			entrypoint:  "/usr/bin/test-entrypoint",
			userUid:     &userUid,
			userGid:     &userGid,
			expectedResult: `contents:
  packages: [
    # Package "test-package" comes in via var.extra_packages
    # To add a version stream image, see the extra_packages variable in config/main.tf to add packages conditionally.
    # Otherwise, just add packages here.
  ]

accounts:
  groups:
    - groupname: nonroot
      gid: 65532
  users:
    - username: nonroot
      uid: 1
      gid: 1
  run-as: 65532

entrypoint:
  command: /usr/bin/test-entrypoint
`,
		},
		{
			name:        "package with run-as",
			packageName: "test-package",
			entrypoint:  "/usr/bin/test-entrypoint",
			runAs:       &runAs,
			expectedResult: `contents:
  packages: [
    # Package "test-package" comes in via var.extra_packages
    # To add a version stream image, see the extra_packages variable in config/main.tf to add packages conditionally.
    # Otherwise, just add packages here.
  ]

accounts:
  groups:
    - groupname: nonroot
      gid: 65532
  users:
    - username: nonroot
      uid: 65532
      gid: 65532
  run-as: 65534

entrypoint:
  command: /usr/bin/test-entrypoint
`,
		},
	}

	for _, tc := range testCases {
		t.Run(tc.name, func(t *testing.T) {
			var (
				userGid  uint16 = 65532
				userUid  uint16 = 65532
				groupGid uint16 = 65532
				runAs    uint16 = 65532
			)

			if tc.userUid != nil {
				userUid = *tc.userUid
			}

			if tc.userGid != nil {
				userGid = *tc.userGid
			}

			if tc.runAs != nil {
				runAs = *tc.runAs
			}

			if tc.groupGid != nil {
				groupGid = *tc.groupGid
			}

			o := scaffoldOptions{
				TemplatesPath: "../../../images/TEMPLATE",
				PackageName:   tc.packageName,
				Entrypoint:    tc.entrypoint,
				ModuleName:    "latest",
				GroupGid:      groupGid,
				UserGid:       userGid,
				UserUid:       userUid,
				RunAs:         runAs,
			}

			writer := strings.Builder{}

			require.NoError(t, o.scaffoldApkoYaml(&writer))
			require.Equal(t, tc.expectedResult, writer.String())
		})
	}
}
