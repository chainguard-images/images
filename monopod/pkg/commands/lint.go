package commands

import (
	"errors"

	"github.com/chainguard-images/images/monopod/pkg/lint"
	"github.com/spf13/cobra"
)

type lintOptions struct {
	args      []string
	verbose   bool
	list      bool
	skipRules []string
}

func Lint() *cobra.Command {
	o := &lintOptions{}
	cmd := &cobra.Command{
		Use:               "lint",
		DisableAutoGenTag: true,
		SilenceUsage:      true,
		SilenceErrors:     true,
		Short:             "Lint apko configs",
		RunE: func(cmd *cobra.Command, args []string) error {
			// args[0] can be used to get the path to the file to lint or `.` to lint the current directory
			// what if given yaml is not apko yaml?
			o.args = args
			return o.LintCmd()
		},
	}
	cmd.Flags().BoolVarP(&o.verbose, "verbose", "v", false, "verbose output")
	cmd.Flags().BoolVarP(&o.list, "list", "l", false, "prints the all of available rules and exits")
	cmd.Flags().StringArrayVarP(&o.skipRules, "skip-rule", "", []string{}, "list of rules to skip")
	return cmd
}

func (o lintOptions) LintCmd() error {
	linter := lint.New(o.makeLintOptions()...)

	// If the list flag is set, print the list of available rules and exit.
	if o.list {
		linter.PrintRules()
		return nil
	}

	// Run the linter.
	result, err := linter.Lint()
	if err != nil {
		return err
	}
	if result.HasErrors() {
		linter.Print(result)
		return errors.New("linting failed")
	}
	return nil
}

func (o lintOptions) makeLintOptions() []lint.Option {
	if len(o.args) == 0 {
		// Lint the current directory by default.
		o.args = []string{"."}
	}

	return []lint.Option{
		lint.WithPath(o.args[0]),
		lint.WithVerbose(o.verbose),
		lint.WithSkipRules(o.skipRules),
	}
}
