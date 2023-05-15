package options

import (
	"github.com/chainguard-images/images/monopod/pkg/constants"
	"github.com/spf13/cobra"
)

// MatrixOptions is the wrapper for options related to matrix.
type MatrixOptions struct {
	TestTags        string
	ModifiedFiles   string
	MelangeMode     string
	UniqueImages    bool
	DefaultRegistry string
}

func (o *MatrixOptions) AddFlags(cmd *cobra.Command) {
	cmd.Flags().StringVar(&o.DefaultRegistry, "default-registry",
		constants.DefaultRegistry,
		"the default registry repo to use if the ref field is missing")
	cmd.Flags().StringVar(&o.TestTags, "test-tags", "",
		"different type of matrix, just the unique image names (comma-separated)")
	cmd.Flags().StringVar(&o.ModifiedFiles, "modified-files", "",
		"a comma-separated list of files modified in the repo")
	cmd.Flags().StringVar(&o.MelangeMode, "melange-mode", "",
		"mode for custom melange builds. Modes: only, none")
	cmd.Flags().BoolVar(&o.UniqueImages, "unique-images", false,
		"different type of matrix, just the unique image names")
}
