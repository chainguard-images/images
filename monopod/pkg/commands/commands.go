package commands

import (
	"github.com/spf13/cobra"
	"sigs.k8s.io/release-utils/version"
)

var root = "."

func New() *cobra.Command {
	cmd := &cobra.Command{
		Use:          "monopod",
		Short:        "Helper cli for interacting with the mono repo",
		SilenceUsage: true,
	}

	cmd.PersistentFlags().StringVar(&root, "root", ".",
		"Root of commands.")

	// Add sub-commands.
	cmd.AddCommand(Matrix(), version.Version())

	return cmd
}
