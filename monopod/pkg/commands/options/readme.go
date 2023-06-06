package options

import (
	"github.com/chainguard-images/images/monopod/pkg/constants"
	"github.com/spf13/cobra"
)

// ReadmeOptions is the wrapper for options related to readme.
type ReadmeOptions struct {
	BadgeRootUrl       string
	SummaryRootUrl     string
	RootReadmeToStdout bool
	Check              bool
	DefaultRegistry    string
}

func (o *ReadmeOptions) AddFlags(cmd *cobra.Command) {
	cmd.Flags().StringVar(&o.DefaultRegistry, "default-registry",
		constants.DefaultRegistry,
		"the default registry repo to use if the ref field is missing")
	cmd.Flags().StringVar(&o.BadgeRootUrl, "badge-root-url",
		"https://storage.googleapis.com/chainguard-images-build-outputs/badges",
		"root URL to obtain badges")
	cmd.Flags().StringVar(&o.SummaryRootUrl, "summary-root-url",
		"https://storage.googleapis.com/chainguard-images-build-outputs/summary",
		"root URL to obtain image summaries")
	cmd.Flags().BoolVar(&o.RootReadmeToStdout, "root-readme-to-stdout", false,
		"only generate the root README.md to stdout (does not modify files)")
	cmd.Flags().BoolVar(&o.Check, "check", false,
		"simply check to make sure all README.md files are up-to-date")
}
