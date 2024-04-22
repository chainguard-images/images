package commands

import (
	"fmt"
	"log"
	"os"
	"path"
	"reflect"
	"slices"
	"sort"
	"strings"

	"github.com/chainguard-images/images/monopod/pkg/commands/options"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/constants"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/generator"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/generator/image"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/generator/toplevel"
	"github.com/chainguard-images/images/monopod/pkg/tfgen/pkg/util"

	"github.com/spf13/cobra"
)

const (
	Image00PublicCopy       = "Image00PublicCopy"
	Image01Outputs          = "Image01Outputs"
	Image01OutputsVersioned = "Image01OutputsVersioned"
	Toplevel01Modules       = "Toplevel01Modules"
	Toplevel02Outputs       = "Toplevel02Outputs"
)

var knownGeneratorsImage = map[string]generator.Generator{
	Image00PublicCopy: &image.GeneratorImage00PublicCopy{
		SourcePathPrefix: "",
	},
	Image01Outputs:          &image.GeneratorImage01Outputs{},
	Image01OutputsVersioned: &image.GeneratorImage01OutputsVersioned{},
}

var knownGeneratorsTopLevel = map[string]generator.Generator{
	Toplevel01Modules: &toplevel.GeneratorToplevel01Modules{},
	Toplevel02Outputs: &toplevel.GeneratorToplevel02Outputs{},
}

var allKnownGeneratorsTfgen = append(sortedMapKeys(knownGeneratorsImage), sortedMapKeys(knownGeneratorsTopLevel)...)

func TFGen() *cobra.Command {
	opts := &options.TFGenOptions{}
	cmd := &cobra.Command{
		Use:               "tfgen",
		DisableAutoGenTag: true,
		SilenceUsage:      true,
		SilenceErrors:     true,
		Args:              cobra.ExactArgs(1),
		Short:             "Generate Terraform files",
		RunE: func(cmd *cobra.Command, args []string) error {
			repoRootDir := args[0]

			if err := validateTFGenGenerators(opts); err != nil {
				return err
			}

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

				if slices.Contains(opts.Skip, name) {
					log.Println("SKIPPING", name)
					continue
				}
				if len(opts.Only) > 0 && !slices.Contains(opts.Only, name) {
					log.Println("SKIPPING", name)
					continue
				}

				subdir := path.Join(imagesDirname, name)
				isEmpty, b, err := generateForImageSubdir(subdir, opts.Skip, opts.Only, opts.Generators)
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
			isEmpty, b, err := generateForToplevel(repoRootDir, opts.Skip, opts.Only, opts.Generators)
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
	opts.AddFlags(cmd)
	return cmd
}

func generateForImageSubdir(subdir string, skip, only, generators []string) (bool, []byte, error) {
	gens := []generator.Generator{}
	for _, k := range generators {
		if gen, ok := knownGeneratorsImage[k]; ok {
			gens = append(gens, gen)
		}
	}
	return generate(subdir, skip, only, gens)
}

func generateForToplevel(root string, skip, only, generators []string) (bool, []byte, error) {
	gens := []generator.Generator{}
	for _, k := range generators {
		if gen, ok := knownGeneratorsTopLevel[k]; ok {
			gens = append(gens, gen)
		}
	}
	return generate(root, skip, only, gens)
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

// From https://stackoverflow.com/a/35366762
func sortedMapKeys(m interface{}) (keyList []string) {
	keys := reflect.ValueOf(m).MapKeys()
	for _, key := range keys {
		keyList = append(keyList, key.Interface().(string))
	}
	sort.Strings(keyList)
	return
}

func validateTFGenGenerators(opts *options.TFGenOptions) error {
	if len(opts.Generators) == 0 {
		return fmt.Errorf("please provided comma-separated list of generators. Possible values: %s",
			strings.Join(allKnownGeneratorsTfgen, ","))
	}
	for _, gen := range opts.Generators {
		if !slices.Contains(allKnownGeneratorsTfgen, gen) {
			return fmt.Errorf("unknown generator: \"%s\". Possible values: %s",
				gen, strings.Join(allKnownGeneratorsTfgen, ","))
		}
	}

	// Require certain inputs using certain generators,
	// resetting generators where necessary with with proper args set
	if slices.Contains(opts.Generators, Image00PublicCopy) {
		if opts.SourcePathPrefix == "" {
			opts.SourcePathPrefix = defaultSourcePathPrefixParentDir
		}
		knownGeneratorsImage[Image00PublicCopy] = &image.GeneratorImage00PublicCopy{
			SourcePathPrefix: opts.SourcePathPrefix,
		}
	}

	return nil
}
