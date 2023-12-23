package commands

import (
	"bytes"
	"context"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"sort"
	"strings"
	"text/template"

	"github.com/hashicorp/hcl/v2"
	"github.com/hashicorp/hcl/v2/hclsyntax"
	"github.com/hashicorp/hcl/v2/hclwrite"
	"github.com/spf13/cobra"
	"github.com/zclconf/go-cty/cty"
	"golang.org/x/exp/maps"
)

type scaffoldOptions struct {
	TemplatesPath string
	OutputPath    string
	ModuleName    string
	PackageName   string
	Entrypoint    string
	DevVariant    bool
	UserGid       uint16
	UserUid       uint16
	GroupGid      uint16
	RunAs         uint16
	MainTf        []byte
}

// Scaffold creates the command that will process the scaffolding.
func Scaffold() *cobra.Command {
	o := &scaffoldOptions{}
	scaffoldCmd := &cobra.Command{
		Use:   "scaffold",
		Short: "scaffold generates scaffolding for an image",
		Long:  `scaffold generates scaffolding for an image, based on the arguments provided`,
		Example: `  # Generate a new image with a dev variant
  monopod scaffold my-new-image --entrypoint /usr/bin/test

  # Generate a new image with no dev variant
  monopod scaffold my-new-image --entrypoint /usr/bin/test --dev-variant=false

  # Generate a new image in a custom folder
  monopod scaffold my-new-image --entrypoint /usr/bin/test --output-path /tmp/output

  # Generate a new image with run-as, user-gid, and group-gid, and custom package name
  monopod scaffold my-new-image --package-name somethingelse --entrypoint /usr/bin/test --run-as 65530 --user-gid 65534 --group-gid 65534`,

		RunE: func(cmd *cobra.Command, args []string) error {
			o.ModuleName = args[0]
			return o.runScaffold(cmd.Context())
		},
		Args: cobra.ExactArgs(1),
	}

	scaffoldCmd.Flags().StringVarP(&o.TemplatesPath, "templates-path", "t", "images/TEMPLATE/", "Path to the templates folder")
	scaffoldCmd.Flags().StringVarP(&o.OutputPath, "output-path", "o", "", "Path to the output folder")
	scaffoldCmd.Flags().StringVarP(&o.PackageName, "package-name", "p", "", "The package name to be used in scaffolding")
	scaffoldCmd.Flags().StringVarP(&o.Entrypoint, "entrypoint", "e", "", "Entrypoint path for the resulting image")
	scaffoldCmd.Flags().BoolVar(&o.DevVariant, "dev-variant", true, "Indicates whether the development variant should be generated")
	scaffoldCmd.Flags().Uint16Var(&o.RunAs, "run-as", 65532, "UID that should be used as the 'run-as' value")
	scaffoldCmd.Flags().Uint16Var(&o.UserUid, "user-uid", 65532, "UID that should be used for the non-root-user uid value")
	scaffoldCmd.Flags().Uint16Var(&o.UserGid, "user-gid", 65532, "GID that should be used for the non-root-user gid value")
	scaffoldCmd.Flags().Uint16Var(&o.GroupGid, "group-gid", 65532, "GID that should be used for the non-root-group gid value")

	return scaffoldCmd
}

// runScaffold does the real work of creating the folders, files, and evaluating
// templates.
func (o scaffoldOptions) runScaffold(ctx context.Context) error {
	if err := o.validateOptions(); err != nil {
		return err
	}

	if err := o.mkImageDir(); err != nil {
		return err
	}

	if err := filepath.Walk("images/TEMPLATE", o.walk); err != nil {
		return err
	}

	// create readme hcl metadata file
	nr := newReadmeImpl{
		Readme:      completeReadme{Name: o.PackageName},
		renderedHCl: new(bytes.Buffer),
	}
	if err := nr.render(); err != nil {
		return err
	}
	if err := nr.write(); err != nil {
		return err
	}

	// render the readme's markdown
	rr := newReadmeRenderer(o.PackageName, &nr.Readme)
	if err := rr.render(); err != nil {
		return err
	}
	if err := rr.write(); err != nil {
		return err
	}

	// read, render, then write main.tf
	if err := o.readMainTf(); err != nil {
		return err
	}
	if err := o.addModuleToMainTf(); err != nil {
		return err
	}
	return o.writeMainTf()
}

func (o *scaffoldOptions) walk(path string, info os.FileInfo, err error) error {
	if err != nil {
		return err
	}

	if info.IsDir() {
		return nil
	}
	repl := strings.Replace(path, "TEMPLATE", o.ModuleName, 1) // Replacing TEMPLATE with the module name
	if err := os.MkdirAll(filepath.Dir(repl), os.ModePerm); err != nil {
		return err
	}

	if strings.HasSuffix(repl, ".tpl") {
		f, err := os.Create(strings.TrimSuffix(repl, ".tpl"))
		if err != nil {
			return err
		}
		defer f.Close()
		log.Println("writing file", f.Name())
		return template.Must(template.ParseFiles(path)).Execute(f, o)
	}

	// Just copy the file without templating.
	b, err := os.ReadFile(path)
	if err != nil {
		return err
	}
	log.Println("writing file", repl)
	return os.WriteFile(repl, b, 0644)
}

// mkImageDir creates the target images/o.moduleName directory
func (o *scaffoldOptions) mkImageDir() error {
	modroot := filepath.Join(o.OutputPath, "images", o.ModuleName)

	if err := os.MkdirAll(modroot, os.ModePerm); err != nil {
		return fmt.Errorf("unable to generate target folder images/%s: %w", o.ModuleName, err)
	}
	return nil
}

// validateOptions validates that the set of options specified is valid and
// check that mandatory arguments have been specified, as well as check that
// the folder specified for template input exists.
func (o *scaffoldOptions) validateOptions() error {
	if _, err := os.Stat(o.TemplatesPath); err != nil {
		return fmt.Errorf("failed to check templates folder at path %s: %w", o.TemplatesPath, err)
	}

	// Entrypoint doesn't need to be set if templates don't use it, but it should fail with a clear error if it's needed.
	if "" == o.Entrypoint {
		o.Entrypoint = "TODO"
	}

	// If the package name is not set, use the module name as a sane default.
	if "" == o.PackageName {
		o.PackageName = o.ModuleName
	}

	return nil
}

// addModuleToMainTf reads main.tf from disk and adds a new module to it
func (o *scaffoldOptions) addModuleToMainTf() error {
	source := fmt.Sprintf("./images/%s", o.ModuleName)
	targetRepo := fmt.Sprintf(` "${var.target_repository}/%s"`, o.ModuleName)
	// use a Token here because hclwrite escapes things like $ in strings
	// even using literals or double escaping doesn't help. See this go.cty issue:
	// https://github.com/zclconf/go-cty/issues/163#issuecomment-1754073585
	toks := hclwrite.Tokens{
		&hclwrite.Token{
			Type:         hclsyntax.TokenStringLit,
			Bytes:        []byte(targetRepo),
			SpacesBefore: 0,
		},
	}

	newModule := hclwrite.NewBlock("module", []string{o.ModuleName})
	newModule.Body().SetAttributeValue("source", cty.StringVal(source))
	newModule.Body().SetAttributeRaw("target_repository", toks)

	f, diags := hclwrite.ParseConfig(o.MainTf, "main.tf", hcl.Pos{
		Line:   0,
		Column: 0,
		Byte:   0,
	})
	if diags != nil {
		return fmt.Errorf("%v", diags)
	}

	newTf := hclwrite.NewEmptyFile()
	blocks := make(map[string]*hclwrite.Block)
	for _, b := range f.Body().Blocks() {
		switch b.Type() {
		// extract modules to the map for sorting later
		case "module":
			blocks[b.Labels()[0]] = b
		// write the block unchanged back to main.tf in the order it appears
		default:
			newTf.Body().AppendBlock(b)
			newTf.Body().AppendNewline()
		}
	}
	// add the new o.scaffold.PackageName module
	blocks[newModule.Labels()[0]] = newModule

	// alphabetize the slice of block names
	labels := maps.Keys(blocks)
	sort.Strings(labels)

	for i, l := range labels {
		newTf.Body().AppendBlock(blocks[l])
		// append a newline for all but the last block in the file
		if i < len(labels)-1 {
			newTf.Body().AppendNewline()
		}
	}
	o.MainTf = newTf.Bytes()

	return nil
}

func (o *scaffoldOptions) readMainTf() error {
	b, err := os.ReadFile("main.tf")
	if err != nil {
		return err
	}
	o.MainTf = b
	return nil
}

func (o *scaffoldOptions) writeMainTf() error {
	return os.WriteFile("main.tf", o.MainTf, 0o644)
}
