package commands

import (
	"errors"
	"fmt"
	"io"
	"os"
	"path/filepath"
	"text/template"

	"github.com/spf13/cobra"
)

const (
	MainTfTemplate       = "main.tf.tpl"
	MainConfigTfTemplate = "main-config.tf.tpl"
	ApkoTemplate         = "template.apko.yaml.tpl"

	ConfigsFolder   = "configs"
	TestsFolder     = "tests"
	GeneratedFolder = "generated"
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

var (
	outputMappings = map[string]string{
		MainTfTemplate:       "main.tf",
		MainConfigTfTemplate: "main.tf",
		ApkoTemplate:         "latest.apko.yaml",
	}

	copyOutputMappings = map[string]string{
		"main-test.tf":    filepath.Join(TestsFolder, "main.tf"),
		"EXAMPLE_TEST.sh": filepath.Join(TestsFolder, "EXAMPLE_TEST.sh"),
	}
)

// Scaffold creates the command that will process the scaffolding.
func Scaffold() *cobra.Command {
	o := &scaffoldOptions{}
	scaffoldCmd := &cobra.Command{
		Use:   "scaffold",
		Short: "scaffold generates scaffolding for an image",
		Long:  `scaffold generates scaffolding for an image, based on the arguments provided`,
		Example: `  # Generate a test image with a dev variant
  monopod scaffold --package-name test --entrypoint /usr/bin/test

  # Generate a test image with no dev variant
  monopod scaffold --package-name test --entrypoint /usr/bin/test --dev-variant=false

  # Generate a test image in a custom folder
  monopod scaffold --package-name test --entrypoint /usr/bin/test --output-path /tmp/output

  # Generate a test image with run-as, user-gid, and group-gid
  monopod scaffold --package-name test --entrypoint /usr/bin/test --run-as 65530 --user-gid 65534 --group-gid 65534`,

		RunE: func(_ *cobra.Command, _ []string) error {
			return o.runScaffold()
		},
		Args: cobra.NoArgs,
	}

	scaffoldCmd.Flags().StringVarP(&o.TemplatesPath, "templates-path", "t", "images/TEMPLATE/", "Path to the templates folder")
	scaffoldCmd.Flags().StringVarP(&o.OutputPath, "output-path", "o", "generated/", "Path to the output folder")
	scaffoldCmd.Flags().StringVarP(&o.ModuleName, "module-name", "m", "latest", "Desired Terraform module name")
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
func (o scaffoldOptions) runScaffold() error {
	if err := o.validateOptions(); err != nil {
		return err
	}

	if err := o.createOutputFolderStructure(); err != nil {
		return err
	}

	// this file should be written to the root of the resulting folder
	mainTfOutfile, err := o.createOutputFile(outputMappings[MainTfTemplate])
	if err != nil {
		return err
	}
	defer mainTfOutfile.Close()

	if err := o.scaffoldMainTerraform(mainTfOutfile); err != nil {
		return err
	}

	// this file should be written in the configs directory
	mainConfigTfOutfile, err := o.createOutputFile(filepath.Join(ConfigsFolder, outputMappings[MainConfigTfTemplate]))
	if err != nil {
		return err
	}
	defer mainConfigTfOutfile.Close()

	if err := o.scaffoldMainConfigTerraform(mainConfigTfOutfile); err != nil {
		return err
	}

	// this file should be written in the configs directory
	apkoOutfile, err := o.createOutputFile(filepath.Join(ConfigsFolder, outputMappings[ApkoTemplate]))
	if err != nil {
		return err
	}
	defer apkoOutfile.Close()

	if err := o.scaffoldApkoYaml(apkoOutfile); err != nil {
		return err
	}

	if err := o.copyNonScaffoldedFiles(); err != nil {
		return err
	}

	return nil
}

// validateOptions validates that the set of options specified is valid and
// check that mandatory arguments have been specified, as well as check that
// the folder specified for template input exists.
func (o scaffoldOptions) validateOptions() error {
	if _, err := os.Stat(o.TemplatesPath); err != nil {
		return fmt.Errorf("failed to check templates folder at path %s: %w", o.TemplatesPath, err)
	}

	if "" == o.Entrypoint {
		return errors.New("--entrypoint must be specified")
	}

	if "" == o.PackageName {
		return errors.New("--package-name must be specified")
	}

	return nil
}

// targetFolderName is a helper to build the output path.
func (o scaffoldOptions) targetFolderName() string {
	return filepath.Join(o.OutputPath, o.PackageName)
}

// createOutputFolderStructure is a helper to create the output folder structure.
func (o scaffoldOptions) createOutputFolderStructure() error {
	path := o.targetFolderName()
	if err := os.MkdirAll(path, os.ModePerm); err != nil {
		return fmt.Errorf("unable to generate target folder %s: %w", path, err)
	}

	for _, f := range []string{ConfigsFolder, TestsFolder} {
		subPath := filepath.Join(path, f)
		if err := os.MkdirAll(subPath, os.ModePerm); err != nil {
			return fmt.Errorf("unable to generate target folder %s: %w", subPath, err)
		}
	}

	return nil
}

// createOutputFile is a helper to create the output files to which the evaluated
// templates will be written.
func (o scaffoldOptions) createOutputFile(fileName string) (*os.File, error) {
	targetFileName := filepath.Join(o.targetFolderName(), fileName)
	file, err := os.Create(targetFileName)
	if err != nil {
		return nil, fmt.Errorf("failed to create file: %w", err)
	}

	return file, nil
}

// loadTemplateFile is a helper to load the template file to be evaluated on a given
// step of scaffolding.
func (o scaffoldOptions) loadTemplateFile(templateName string) (*template.Template, error) {
	templatePath := filepath.Join(o.TemplatesPath, templateName)
	tmpl, err := template.ParseFiles(templatePath)
	if err != nil {
		return nil, fmt.Errorf("failed to read template %s: %w", templatePath, err)
	}

	return tmpl, nil
}

// processTemplate is a helper to evaluate the loaded template.
func (o scaffoldOptions) processTemplate(template *template.Template, outfile io.Writer) error {
	err := template.Execute(outfile, o)
	if err != nil {
		return fmt.Errorf("failed to execute template: %w", err)
	}

	return nil
}

// copyFiles copies a single file from the source path to the destination path.
func copyFiles(src, dest string) error {
	srcFile, err := os.Open(src)
	if err != nil {
		return fmt.Errorf("failed to read file %s: %w", src, err)
	}
	defer srcFile.Close()

	dstFile, err := os.Create(dest)
	if err != nil {
		return fmt.Errorf("failed to read file: %s: %w", dest, err)
	}
	defer dstFile.Close()

	_, err = dstFile.ReadFrom(srcFile)
	if err != nil {
		return fmt.Errorf("failed to copy file data %s to %s: %w", src, dest, err)
	}

	return nil
}

// scaffoldMainTerraform scaffolds the main.tf file
func (o scaffoldOptions) scaffoldMainTerraform(writer io.Writer) error {
	tmpl, err := o.loadTemplateFile(MainTfTemplate)
	if err != nil {
		return err
	}

	return o.processTemplate(tmpl, writer)
}

// scaffoldApkoYaml scaffolds the latest.apko.yaml file.
func (o scaffoldOptions) scaffoldApkoYaml(writer io.Writer) error {
	tmpl, err := o.loadTemplateFile(ApkoTemplate)
	if err != nil {
		return err
	}

	return o.processTemplate(tmpl, writer)
}

// scaffoldMainConfigTerraform
func (o scaffoldOptions) scaffoldMainConfigTerraform(writer io.Writer) error {
	tmpl, err := o.loadTemplateFile(MainConfigTfTemplate)
	if err != nil {
		return err
	}

	return o.processTemplate(tmpl, writer)
}

// copyNonScaffoldedFiles copies the files that do not have templating.
func (o scaffoldOptions) copyNonScaffoldedFiles() error {
	for key, val := range copyOutputMappings {
		if err := copyFiles(filepath.Join(o.TemplatesPath, key), filepath.Join(o.targetFolderName(), val)); err != nil {
			return err
		}
	}

	return nil
}
