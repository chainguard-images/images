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

// this isn't the most granular test since it chains things together
// but it does exercise the important methods and fails any invalid step
func TestScaffoldSingleModule(t *testing.T) {
	tests := []struct {
		name    string
		opts    *scaffoldOptions
		want    *scaffoldOptions
		wantErr bool
	}{
		{
			name: "add single module to main.tf",
			opts: &scaffoldOptions{
				ModuleName: "apko",
			},
			want: &scaffoldOptions{
				MainTf: []byte(singleModuleWant),
			},
			wantErr: false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			o := tt.opts
			if err := o.addModuleToMainTf(); err != nil {
				t.Fatalf("Error generating module block: %s\n", err)
			}

			want := tt.want
			got := o.MainTf
			if !reflect.DeepEqual(got, want.MainTf) {
				t.Errorf("\ngot:\t%s\nwant:\t%s\n", string(got), string(tt.want.MainTf))
			}
		})
	}
}

func TestScaffoldSortModules(t *testing.T) {
	tests := []struct {
		name    string
		opts    []*scaffoldOptions
		want    []byte
		wantErr bool
	}{
		{
			name: "sort modules in main.tf",
			// note these are deliberately not in alphabetical order
			opts: []*scaffoldOptions{
				{
					ModuleName: "apko",
				},
				{
					ModuleName: "zookeeper",
				},
				{
					ModuleName: "wolfi-base",
				},
			},
			want:    []byte(multiModuleWant),
			wantErr: false,
		},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {

			// the idea here is to accumulate module blocks with each loop.
			// The order in the tests struct is deliberately not sorted.
			// The result at the end ought to be an alphabetized set of modules.
			got := []byte{}
			for _, o := range tt.opts {
				o.MainTf = got
				if err := o.addModuleToMainTf(); err != nil {
					t.Fatalf("Error generating module block: %s\n", err)
				}
				got = o.MainTf
			}

			want := tt.want
			if !reflect.DeepEqual(got, want) {
				t.Errorf("\ngot:\t%s\nwant:\t%s\n", string(got), string(want))
			}
		})
	}
}
