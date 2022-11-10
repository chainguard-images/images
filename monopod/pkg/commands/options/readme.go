package options

import (
	"github.com/spf13/cobra"
)

// ReadmeOptions is the wrapper for options related to readme.
type ReadmeOptions struct{}

func (o *ReadmeOptions) AddFlags(cmd *cobra.Command) {
	// cmd.Flags().StringVar( ... )
}
