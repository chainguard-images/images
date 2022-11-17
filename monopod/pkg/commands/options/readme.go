package options

import (
	"github.com/spf13/cobra"
)

// ReadmeOptions is the wrapper for options related to readme.
type ReadmeOptions struct {
	BadgeRootUrl string
}

func (o *ReadmeOptions) AddFlags(cmd *cobra.Command) {
	cmd.Flags().StringVar(&o.BadgeRootUrl, "badge-root-url",
		"https://storage.googleapis.com/chainguard-images-build-outputs/badges",
		"root URL to obtain badges")
}
