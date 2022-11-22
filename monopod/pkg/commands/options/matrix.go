package options

import (
	"github.com/spf13/cobra"
)

// MatrixOptions is the wrapper for options related to matrix.
type MatrixOptions struct {
	ModifiedFiles string
	MelangeMode   string
}

func (o *MatrixOptions) AddFlags(cmd *cobra.Command) {
	cmd.Flags().StringVar(&o.ModifiedFiles, "modified-files", "",
		"a comma-separated list of files modified in the repo")
	cmd.Flags().StringVar(&o.MelangeMode, "melange-mode", "",
		"mode for custom melange builds. Modes: only, none")
}
