package options

import (
	"github.com/spf13/cobra"
)

// MatrixOptions is the wrapper for options related to matrix.
type MatrixOptions struct{}

func (o *MatrixOptions) AddFlags(cmd *cobra.Command) {
	// cmd.Flags().StringVar( ... )
}
