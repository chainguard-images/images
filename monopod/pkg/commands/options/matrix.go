package options

import (
	"github.com/chainguard-images/images/monopod/pkg/constants"
	"github.com/spf13/cobra"
)

// MatrixOptions is the wrapper for options related to matrix.
type MatrixOptions struct {
	ModifiedFiles   string
	UniqueImages    bool
	Shard           uint
	ShardingFactor  uint
	DefaultRegistry string
}

func (o *MatrixOptions) AddFlags(cmd *cobra.Command) {
	cmd.Flags().StringVar(&o.DefaultRegistry, "default-registry",
		constants.DefaultRegistry,
		"the default registry repo to use if the ref field is missing")
	cmd.Flags().StringVar(&o.ModifiedFiles, "modified-files", "",
		"a comma-separated list of files modified in the repo")
	cmd.Flags().BoolVar(&o.UniqueImages, "unique-images", false,
		"different type of matrix, just the unique image names")
	cmd.Flags().UintVar(&o.Shard, "shard", 0, "Which shard to emit (zero-based).")
	cmd.Flags().UintVar(&o.ShardingFactor, "sharding-factor", 1,
		"The number of shards to split the matrix into.")
}
