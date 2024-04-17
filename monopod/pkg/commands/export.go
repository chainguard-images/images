package commands

import (
	"fmt"
	"log"
	"os"
	"path"
	"slices"
	"strings"
	"time"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/generator"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/generator/mutate"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"

	"github.com/spf13/cobra"
)

const (
	Mutate01VersionedPublisher = "Mutate01VersionedPublisher"
	Mutate02PrefixSourcePaths  = "Mutate02PrefixSourcePaths"

	defaultSourcePathPrefixParentDir = "../../public/images/"
)

var defaultExportGenerators = []string{
	Mutate01VersionedPublisher,
	Mutate02PrefixSourcePaths,
}

var knownGeneratorsExport = map[string]generator.Generator{
	Mutate01VersionedPublisher: &mutate.GeneratorMutate01VersionedPublisher{
		MainPackage: "",
	},
	Mutate02PrefixSourcePaths: &mutate.GeneratorMutate02PrefixSourcePaths{
		SourcePathPrefix: "",
	},
}

var allKnownGeneratorsExport = sortedMapKeys(knownGeneratorsExport)

func Export() *cobra.Command {
	opts := &options.ExportOptions{}
	cmd := &cobra.Command{
		Use: "export",
		Example: `
monopod export ./images/zot ./zot-custom
`,
		DisableAutoGenTag: true,
		SilenceUsage:      true,
		SilenceErrors:     true,
		Args:              cobra.ExactArgs(2),
		Short:             "Export public image to new location (applying generators etc.)",
		RunE: func(cmd *cobra.Command, args []string) error {
			opts.Source = args[0]
			opts.Destination = args[1]
			if err := validateExportGenerators(opts); err != nil {
				return err
			}

			log.Printf("Reading from source: %s", opts.Source)
			tfFiles, err := util.LoadAllTerraformFilesInDir(opts.Source)
			if err != nil {
				return err
			}
			data := util.CombinedNoGenerated(tfFiles)

			for _, k := range opts.Generators {
				log.Printf("Running generator: %s", k)
				knownGeneratorsExport[k].Generate(opts.Source, nil, nil, data)
			}

			dstMainTf := path.Join(opts.Destination, constants.MainTfFilename)
			log.Printf("Exporting to destination: %s", dstMainTf)
			if err := os.MkdirAll(opts.Destination, 0755); err != nil {
				return err
			}
			header := fmt.Sprintf("# exported by monopod at %s", time.Now().UTC())
			b := []byte(fmt.Sprintf("%s\n\n%s\n", header, data))
			if err := os.WriteFile(dstMainTf, b, 0644); err != nil {
				return err
			}

			return nil
		},
	}
	opts.AddFlags(cmd)
	return cmd
}

func validateExportGenerators(opts *options.ExportOptions) error {
	if len(opts.Generators) == 0 {
		opts.Generators = defaultExportGenerators
	}
	for _, gen := range opts.Generators {
		if !slices.Contains(allKnownGeneratorsExport, gen) {
			return fmt.Errorf("unknown generator: \"%s\". Possible values: %s",
				gen, strings.Join(allKnownGeneratorsExport, ","))
		}
	}

	// Require certain inputs using certain generators,
	// resetting generators where necessary with with proper args set
	if slices.Contains(opts.Generators, Mutate01VersionedPublisher) {
		if opts.MainPackage == "" {
			return fmt.Errorf("must supply --main-package when using %s generator", Mutate01VersionedPublisher)
		}

		knownGeneratorsExport[Mutate01VersionedPublisher] = &mutate.GeneratorMutate01VersionedPublisher{
			MainPackage: opts.MainPackage,
		}
	}

	if slices.Contains(opts.Generators, Mutate02PrefixSourcePaths) {
		if opts.SourcePathPrefix == "" {
			opts.SourcePathPrefix = path.Join(defaultSourcePathPrefixParentDir, path.Base(opts.Source))
		}
		knownGeneratorsExport[Mutate02PrefixSourcePaths] = &mutate.GeneratorMutate02PrefixSourcePaths{
			SourcePathPrefix: opts.SourcePathPrefix,
		}
	}

	return nil
}
