package commands

import (
	"reflect"
	"testing"
)

const singleModuleWant = `module "apko" {
  source            = "./images/apko"
  target_repository = "${var.target_repository}/apko"
}
`

const multiModuleWant = `module "apko" {
  source            = "./images/apko"
  target_repository = "${var.target_repository}/apko"
}

module "wolfi-base" {
  source            = "./images/wolfi-base"
  target_repository = "${var.target_repository}/wolfi-base"
}

module "zookeeper" {
  source            = "./images/zookeeper"
  target_repository = "${var.target_repository}/zookeeper"
}
`

func TestScaffoldSingleModule(t *testing.T) {
	opts := &scaffoldOptions{
		ModuleName: "apko",
	}
	want := &scaffoldOptions{
		MainTf: []byte(singleModuleWant),
	}

	t.Run("add single module to main.tf", func(t *testing.T) {
		if err := opts.addModuleToMainTf(); err != nil {
			t.Fatalf("Error generating module block: %s\n", err)
		}

		got := opts.MainTf
		if !reflect.DeepEqual(got, want.MainTf) {
			t.Errorf("\ngot:\t%s\nwant:\t%s\n", string(got), string(want.MainTf))
		}
	})

}

func TestScaffoldSortModules(t *testing.T) {
	// note these are deliberately not in alphabetical order
	opts := []*scaffoldOptions{
		{ModuleName: "apko"},
		{ModuleName: "zookeeper"},
		{ModuleName: "wolfi-base"},
	}
	want := []byte(multiModuleWant)

	// the idea here is to accumulate module blocks with each loop.
	// The order in the tests struct is deliberately not sorted.
	// The result at the end ought to be an alphabetized set of modules.
	t.Run("sort modules in main.tf", func(t *testing.T) {

		got := []byte{}
		for _, o := range opts {
			o.MainTf = got
			if err := o.addModuleToMainTf(); err != nil {
				t.Fatalf("Error generating module block: %s\n", err)
			}
			got = o.MainTf
		}

		if !reflect.DeepEqual(got, want) {
			t.Errorf("\ngot:\t%s\nwant:\t%s\n", string(got), string(want))
		}
	})

}
