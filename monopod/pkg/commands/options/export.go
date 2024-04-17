package options

import (
	"github.com/spf13/cobra"
)

// ExportOptions is the wrapper for options related to export.
type ExportOptions struct {
	Source           string
	Destination      string
	Generators       []string
	MainPackage      string
	SourcePathPrefix string
}

func (o *ExportOptions) AddFlags(cmd *cobra.Command) {
	cmd.Flags().StringSliceVar(&o.Generators, "generators", nil, "Run the provided generators")
	cmd.Flags().StringVarP(&o.MainPackage, "main-package", "", "", "The apk package to use for tagging/versioning")
	cmd.Flags().StringVarP(&o.SourcePathPrefix, "source-path-prefix", "", "", "A prefix to use for all source attributes")
}
