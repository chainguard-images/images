package constants

const (
	ImagesDirName         = "images"
	ImageManifestFilename = "image.yaml"

	GithubActionsDirName = ".github"

	MonopodDirName = "monopod"

	DefaultTestScriptFilename = "test.sh"

	DefaultRegistry = "ghcr.io/chainguard-images"

	DefaultRegistryFrontend = "cgr.dev/chainguard"

	DefaultApkoKeyringAppend = "/github/workspace/melange.rsa.pub"

	DefaultApkoRepositoryAppend = "/github/workspace/packages"

	RegistryUI = "https://registry-ui.chainguard.app"

	ApkoYamlFileExtension = ".apko.yaml"

	DefaultImageStatus = "stable"

	ImageReadmeGenStartComment = "<!--monopod:start-->"

	ImageReadmeGenEndComment = "<!--monopod:end-->"
)
