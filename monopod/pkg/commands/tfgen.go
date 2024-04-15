package commands

import (
	"log"
	"os"
	"path"
	"slices"

	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/generator"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/generator/image"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/generator/toplevel"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"
	"github.com/spf13/cobra"
)

func TFGen() *cobra.Command {
	var skip, only []string
	cmd := &cobra.Command{
		Use:               "tfgen",
		DisableAutoGenTag: true,
		SilenceUsage:      true,
		SilenceErrors:     true,
		Args:              cobra.ExactArgs(1),
		Short:             "Generate Terraform files",
		RunE: func(cmd *cobra.Command, args []string) error {
			repoRootDir := args[0]

			// First generate for all of the image subdirectories
			imagesDirname := path.Join(repoRootDir, constants.ImagesDirname)
			entries, err := os.ReadDir(imagesDirname)
			if err != nil {
				log.Fatal(err)
			}
			for _, entry := range entries {
				if !entry.IsDir() {
					continue
				}
				name := entry.Name()

				if slices.Contains(skip, name) {
					log.Println("SKIPPING", name)
					continue
				}
				if len(only) > 0 && !slices.Contains(only, name) {
					log.Println("SKIPPING", name)
					continue
				}

				subdir := path.Join(imagesDirname, name)
				isEmpty, b, err := generateForImageSubdir(subdir, skip, only)
				if err != nil {
					log.Fatal(subdir, err)
				}
				if isEmpty {
					continue
				}
				f := path.Join(subdir, constants.GeneratedTfFilename)
				if util.ShouldOverwrite(f, b) {
					if err := os.WriteFile(f, b, 0644); err != nil {
						log.Fatal(subdir, err)
					}
					log.Printf("INFO Generated %s/%s/%s\n", constants.ImagesDirname, name, constants.GeneratedTfFilename)
				}
			}

			// Then do for the repo top-level
			isEmpty, b, err := generateForToplevel(repoRootDir, skip, only)
			if err != nil {
				log.Fatal(err)
			}
			if isEmpty {
				return nil
			}
			f := path.Join(repoRootDir, constants.GeneratedTfFilename)
			if util.ShouldOverwrite(f, b) {
				if err := os.WriteFile(f, b, 0644); err != nil {
					log.Fatal(err)
				}
				log.Printf("INFO Generated %s\n", constants.GeneratedTfFilename)
			}
			return nil
		},
	}
	cmd.Flags().StringSliceVar(&skip, "skip", nil, "Skip generating for the specified image subdirectories")
	cmd.Flags().StringSliceVar(&only, "only", nil, "Only generate for the specified image subdirectories")
	return cmd
}

func generateForImageSubdir(subdir string, skip, only []string) (bool, []byte, error) {
	return generate(subdir, skip, only, []generator.Generator{
		&image.GeneratorImage01Outputs{},
	})
}

func generateForToplevel(root string, skip, only []string) (bool, []byte, error) {
	return generate(root, skip, only, []generator.Generator{
		&toplevel.GeneratorToplevel01Modules{},
		&toplevel.GeneratorToplevel02Outputs{},
	})
}

func generate(dir string, skip, only []string, generators []generator.Generator) (bool, []byte, error) {
	data := util.EmptyTerraformFile()
	for _, generator := range generators {
		if err := generator.Generate(dir, skip, only, data); err != nil {
			return true, nil, err
		}
	}
	return len(data.Body.Blocks) == 0, util.TerraformFileToBytes(data), nil
}
