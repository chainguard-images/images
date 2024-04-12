package commands

import (
	"context"
	"encoding/json"
	"fmt"
	"os"
	"path/filepath"
	"sort"
	"strings"

	"github.com/chainguard-dev/clog"
	"github.com/hashicorp/hcl/v2"
	"github.com/hashicorp/hcl/v2/hclparse"
	"github.com/spf13/cobra"

	"github.com/chainguard-images/images/monopod/pkg/images"
)

func Coverage() *cobra.Command {
	cmd := &cobra.Command{
		Use:   "coverage",
		Short: "Generate a test coverage report",
		Example: `
monopod coverage
`,
		RunE: func(cmd *cobra.Command, args []string) error {
			impl := &coverageImpl{}
			return impl.Do(cmd.Context())
		},
	}

	return cmd
}

// nabbed from https://github.com/hashicorp/terraform/blob/d1761f436b636da959ad5865591d53edbe9df8b3/internal/configs/parser_config.go#L273
var configFileSchema = &hcl.BodySchema{
	Blocks: []hcl.BlockHeaderSchema{
		{
			Type: "terraform",
		},
		{
			// This one is not really valid, but we include it here so we
			// can create a specialized error message hinting the user to
			// nest it inside a "terraform" block.
			Type: "required_providers",
		},
		{
			Type:       "provider",
			LabelNames: []string{"name"},
		},
		{
			Type:       "variable",
			LabelNames: []string{"name"},
		},
		{
			Type: "locals",
		},
		{
			Type:       "output",
			LabelNames: []string{"name"},
		},
		{
			Type:       "module",
			LabelNames: []string{"name"},
		},
		{
			Type:       "resource",
			LabelNames: []string{"type", "name"},
		},
		{
			Type:       "data",
			LabelNames: []string{"type", "name"},
		},
		{
			Type: "moved",
		},
		{
			Type: "removed",
		},
		{
			Type: "import",
		},
		{
			Type:       "check",
			LabelNames: []string{"name"},
		},
	},
}

type coverageImpl struct {
	modules []*moduleContext
}

// moduleContext is the parsing context for an individual terraform module.
type moduleContext struct {
	// p is the parser to accumulate and parse terraform files
	p *hclparse.Parser `json:"-"`

	Module            string `json:"module"`
	HasTest           bool   `json:"has_test"`
	IsImagetest       bool   `json:"is_imagetest"`
	UsingPublicModule bool   `json:"using_public_module"`
	UsingPublicTests  bool   `json:"using_public_tests"`
	UsingLocalTests   bool   `json:"using_local_tests"`
}

func (i *coverageImpl) Do(ctx context.Context) error {
	return i.generateCoverageReport(ctx)
}

func (i *coverageImpl) generateCoverageReport(ctx context.Context) error {
	// log := clog.FromContext(ctx)
	allImages, err := images.ListAll()
	if err != nil {
		return err
	}

	sort.Slice(allImages, func(i, j int) bool {
		return allImages[i].ImageName < allImages[j].ImageName
	})

	for _, img := range allImages {
		// log.Infof("./images/%s/main.tf\n", i.ImageName)
		mainTf := fmt.Sprintf("./images/%s/main.tf", img.ImageName)

		c := moduleContext{
			Module: img.ImageName,
			p:      hclparse.NewParser(),
		}

		if err := c.huntFiles(ctx, mainTf); err != nil {
			return fmt.Errorf("hunting terraform files: %w", err)
		}

		if err := c.parseFiles(ctx); err != nil {
			return fmt.Errorf("parsing terraform files: %w", err)
		}

		i.modules = append(i.modules, &c)
	}

	f, _ := os.Create("output.json")
	defer f.Close()
	b, err := json.Marshal(i.modules)
	if err != nil {
		return err
	}
	f.Write(b)
	return nil
}

// huntFiles hunts for terraform files used by the top level module. It simply
// parses the files and looks for more. The hclparse.Parser saves a map of
// all files it has parsed so we are just preprocessing and collecting all
// files here.
//
// It ignores tf files in tflib right now. There is no strict standard on module
// names so we instead we ignore modules coming from a common source (rather
// than trying to regex all `publisher/latest/etc` module names)
func (c *moduleContext) huntFiles(ctx context.Context, file string) error {
	// log := clog.FromContext(ctx)
	f, diags := c.p.ParseHCLFile(file)
	if diags != nil {
		return fmt.Errorf("%v", diags)
	}

	content, diags := f.Body.Content(configFileSchema)
	if diags != nil {
		return fmt.Errorf("%v", diags)
	}

	for _, b := range content.Blocks {
		if b.Type != "module" {
			continue
		}

		att, diags := b.Body.JustAttributes()
		if diags != nil {
			return fmt.Errorf("%v", diags)
		}

		// Get the source attribute of the block
		if val, ok := att["source"]; ok {
			// Pass a nil context, assuming there are no expressions in
			// the source string. This will fail if a variable expression
			// exists in the string
			//
			// TODO: handle context
			// TODO: don't kill the whole process if one module errs
			v, diags := val.Expr.Value(nil)
			if diags != nil {
				return fmt.Errorf("%v", diags)
			}

			// Ignore files in tflib
			if strings.Contains(v.AsString(), "tflib") {
				continue
			}

			// Get path of current parsed file
			path := filepath.Join(filepath.Dir(file), v.AsString())
			files, err := filepath.Glob(filepath.Join(path, "*.tf"))
			if err != nil {
				return err
			}

			for _, tfFile := range files {
				c.huntFiles(ctx, tfFile)
			}
		}
	}
	return nil
}

func (c *moduleContext) parseFiles(ctx context.Context) error {
	log := clog.FromContext(ctx)

	c.HasTest = false

	for filename, tfFile := range c.p.Files() {
		log.Infof("|-- %s", filename)
		c.UsingPublicModule = c.UsingPublicModule || strings.Contains(filename, "public/")

		content, diags := tfFile.Body.Content(configFileSchema)
		if diags != nil {
			return fmt.Errorf("%v", diags)
		}

		for _, b := range content.Blocks {
			log.Infof("|---- %s", b.Type)
			for _, l := range b.Labels {
				log.Infof("|------ %s", l)
				for _, key := range []string{
					"imagetest_inventory",
					"imagetest_harness_",
					"imagetest_feature",
					"oci_exec_test",
					"helm_release",
					"helm-cleanup",
				} {
					if strings.Contains(l, key) {
						c.HasTest = true
						c.IsImagetest = c.IsImagetest || strings.Contains(key, "imagetest")
						c.UsingPublicTests = c.UsingPublicTests || strings.Contains(filename, "public/")
						c.UsingLocalTests = c.UsingLocalTests || !strings.Contains(filename, "public/")
					}
				}
			}
		}
	}
	return nil
}

func (c *moduleContext) String() string {
	b, err := json.Marshal(c)
	if err != nil {
		panic(err)
	}
	return string(b)
}
