package lint

import (
	"errors"
	"fmt"
	"os"
	"path/filepath"
	"strconv"

	"chainguard.dev/apko/pkg/build/types"
	"github.com/dprotaso/go-yit"
	"golang.org/x/exp/slices"
	"gopkg.in/yaml.v3"
)

// AllRules is a list of all available rules to evaluate.
var AllRules = func(l *Linter) Rules {
	return Rules{
		{
			Name:        "paths-permissions",
			Description: "Checks if the permissions of the paths in the image are correct.",
			Severity:    SeverityError,
			LintFunc: func(c types.ImageConfiguration) error {
				var errs []error
				for _, p := range c.Paths {
					if p.Permissions > 0o777 {
						errs = append(errs, errors.New("path '/var/lib/postgresql/data' has invalid permissions '1411'"))
					}
				}
				return errors.Join(errs...)
			},
		},
		{
			Name:        "tf-minimal",
			Description: "Checks if TF image config omits unnecessary fields.",
			Severity:    SeverityError,
			LintFunc: func(c types.ImageConfiguration) error {
				var errs []error
				if len(c.Contents.Keyring) != 0 {
					errs = append(errs, errors.New("keyring is not empty"))
				}
				if len(c.Contents.Repositories) != 0 {
					errs = append(errs, errors.New("repositories is not empty"))
				}
				if len(c.Archs) != 0 {
					errs = append(errs, errors.New("archs is not empty"))
				}
				if slices.Contains(c.Contents.Packages, "wolfi-baselayout") {
					errs = append(errs, errors.New("wolfi-baselayout is in packages"))
				}
				if slices.Contains(c.Contents.Packages, "ca-certificates-bundle") {
					errs = append(errs, errors.New("ca-certificates-bundle is in packages, but is already present from wolfi-baselayout"))
				}
				if slices.Contains(c.Contents.Packages, "chainguard-baselayout") {
					errs = append(errs, errors.New("chainguard-baselayout is in packages"))
				}
				return errors.Join(errs...)
			},
			ConditionFuncs: []ConditionFunc{
				func(path string) bool {
					// Only run when the parent directory contains a main.tf file.
					_, err := os.Stat(filepath.Join(filepath.Dir(path), "..", "main.tf"))
					return err == nil
				},
			},
		},
		{
			Name:        "accounts-runas",
			Description: "Checks if the runas field is set properly for all accounts.",
			Severity:    SeverityError,
			LintFunc: func(c types.ImageConfiguration) error {
				var errs []error
				if c.Accounts.RunAs != "" {
					uid, err := strconv.ParseUint(c.Accounts.RunAs, 10, 16)
					if err != nil {
						errs = append(errs, errors.New("runas is not a valid numeric uid"))
					}
					if uid > 65536 {
						errs = append(errs, errors.New("runas is not a valid uid (out of range)"))
					}
				}
				return errors.Join(errs...)
			},
		},
		{
			Name:        "tagged-repository-in-environment-repos",
			Description: "remove tagged repositories like @local from the repositories block",
			Severity:    SeverityError,
			LintFunc: func(c types.ImageConfiguration) error {
				for _, repo := range c.Contents.Repositories {
					if repo[0] == '@' {
						return fmt.Errorf("repository %q is tagged", repo)
					}
				}
				return nil
			},
		},
	}
}

// NodeFromMapping takes a yaml.Node (a mapping) and uses yit
// to find a child node in the mapping with the given key.
func NodeFromMapping(parentNode *yaml.Node, key string) (*yaml.Node, error) {
	it := yit.FromNode(parentNode).
		ValuesForMap(yit.WithValue(key), yit.All)

	if childNode, ok := it(); ok {
		return childNode, nil
	}

	return nil, fmt.Errorf("key '%s' not found in mapping", key)
}
