package lint

import (
	"errors"
	"fmt"
	"path/filepath"
	"testing"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
)

func newTestLinterWithFile(path string) *Linter {
	return New(WithPath(filepath.Join("testdata/", path)))
}
func TestLinter_Rules(t *testing.T) {
	for _, tt := range []struct {
		name    string
		file    string
		want    EvalResult
		wantErr bool
	}{{
		name: "paths-permissions",
		file: "paths-permissions.yaml",
		want: EvalResult{
			File: "testdata/paths-permissions.yaml",
			Errors: []EvalRuleError{{
				Rule: Rule{
					Name:     "paths-permissions",
					Severity: SeverityError,
				},
				Error: errors.New("[paths-permissions]: path '/var/lib/postgresql/data' has invalid permissions '1411' (ERROR)"),
			}},
		},
	}, {
		file: "forbidden-repository-tagged.yaml",
		want: EvalResult{
			File: "testdata/forbidden-repository-tagged.yaml",
			Errors: EvalRuleErrors{
				{
					Rule: Rule{
						Name:     "tagged-repository-in-environment-repos",
						Severity: SeverityError,
					},
					Error: fmt.Errorf("[tagged-repository-in-environment-repos]: repository \"@local ./foo\" is tagged (ERROR)"),
				},
			},
		},
		wantErr: false,
	}} {
		t.Run(tt.file, func(t *testing.T) {
			l := newTestLinterWithFile(tt.file)
			got, err := l.Lint()
			if (err != nil) != tt.wantErr {
				t.Errorf("Lint() error = %v, wantErr %v", err, tt.wantErr)
				return
			}

			// Always should be a single element array.
			require.Len(t, got, 1)

			g := got[0]

			// Ensure we're testing the right file.
			assert.Equal(t, tt.want.File, g.File)
			// Fast-fail if lengths don't match.
			require.Len(t, g.Errors, len(tt.want.Errors))

			for i, e := range g.Errors {
				assert.Equal(t, e.Error, tt.want.Errors[i].Error, "Lint(): Error: got = %v, want %v", e.Error, tt.want.Errors[i].Error)
				assert.Equal(t, e.Rule.Name, tt.want.Errors[i].Rule.Name, "Lint(): Rule.Name: got = %v, want %v", e.Rule.Name, tt.want.Errors[i].Rule.Name)
				assert.Equal(t, e.Rule.Severity, tt.want.Errors[i].Rule.Severity, "Lint(): Rule.Severity: got = %v, want %v", e.Rule.Severity, tt.want.Errors[i].Rule.Severity)
			}
		})
	}
}
