package options

import (
	"github.com/spf13/cobra"
)

// TFGenOptions is the wrapper for options related to tfgen.
type TFGenOptions struct {
	Skip             []string
	Only             []string
	Generators       []string
	SourcePathPrefix string
}

func (o *TFGenOptions) AddFlags(cmd *cobra.Command) {
	cmd.Flags().StringSliceVar(&o.Skip, "skip", nil, "Skip generating for the specified image subdirectories")
	cmd.Flags().StringSliceVar(&o.Only, "only", nil, "Only generate for the specified image subdirectories")
	cmd.Flags().StringSliceVar(&o.Generators, "generators", nil, "Run the provided generators")
	cmd.Flags().StringVarP(&o.SourcePathPrefix, "source-path-prefix", "", "", "A prefix to use for all source attributes")
}
