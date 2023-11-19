package commands

import (
	"bufio"
	"context"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"
	"text/template"

	"github.com/spf13/cobra"
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

	return o.addModuleToMainTf()
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
			panic(err.Error())
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

func (o scaffoldOptions) addModuleToMainTf() error {
	file, err := os.OpenFile("main.tf", os.O_RDWR, os.ModePerm)
	if err != nil {
		fmt.Printf("Error opening file: %v\n", err)
		os.Exit(1)
	}
	defer file.Close()

	updatedContent, err := o.parseAndUpdateContent(file)
	if err != nil {
		return err
	}

	// Truncate the file to remove any remaining content
	file.Truncate(0)
	file.Seek(0, 0)

	// Write the updated content back to the file
	writer := bufio.NewWriter(file)
	for _, line := range updatedContent {
		fmt.Fprintln(writer, line)
	}
	writer.Flush()

	return nil
}

func (o *scaffoldOptions) parseAndUpdateContent(file *os.File) ([]string, error) {
	// Define the module source
	moduleSource := "./images/%s"

	// Define the target repository
	targetRepository := "${var.target_repository}"

	// Create a slice to hold the lines of the updated content
	var updatedContent []string

	// Track whether the module block has been inserted
	moduleInserted := false

	scanner := bufio.NewScanner(file)
	for scanner.Scan() {
		line := scanner.Text()

		// Check if this is where the module block should be inserted
		if !moduleInserted && strings.HasPrefix(line, "module ") {
			l := strings.TrimPrefix(
				strings.ReplaceAll(
					strings.TrimSuffix(
						line, " {",
					),
					"\"", "",
				),
				"module ",
			)
			if strings.Compare(o.PackageName, l) == 0 {
				return nil, fmt.Errorf("module %s block already exists in main.tf", o.PackageName)
			}
			if strings.Compare(o.PackageName, l) < 0 {
				// Insert the new module block here
				updatedContent = append(updatedContent,
					fmt.Sprintf("module \"%s\" {", o.PackageName),
					fmt.Sprintf("  source            = \"%s\"", fmt.Sprintf(moduleSource, o.PackageName)),
					fmt.Sprintf("  target_repository = \"%s/%s\"", targetRepository, o.PackageName), "}",
					fmt.Sprintf(""), // this line will be added as a blank line after the new module added
				)
				moduleInserted = true
			}
		}

		// Append the current line to the updated content
		updatedContent = append(updatedContent, line)
	}
	return updatedContent, nil
}
