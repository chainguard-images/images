package lint

import (
	"errors"
	"fmt"

	"chainguard.dev/apko/pkg/build/types"
	"github.com/dprotaso/go-yit"
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
