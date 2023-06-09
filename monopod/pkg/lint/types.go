package lint

import (
	"chainguard.dev/apko/pkg/build/types"
	"github.com/hashicorp/go-multierror"
)

// Function is a function that lints a single configuration.
type Function func(types.ImageConfiguration) error

// ConditionFunc is a function that checks if a rule should be executed.
// dir is the path to the detected apko YAML file.
type ConditionFunc func(path string) bool

// Severity is the severity of a rule.
type Severity string

const (
	SeverityError   Severity = "ERROR"
	SeverityWarning Severity = "WARNING"
	SeverityInfo    Severity = "INFO"
)

// Rule represents a linter rule.
type Rule struct {
	// Name is the name of the rule.
	Name string

	// Description is the description of the rule.
	Description string

	// Severity is the severity of the rule.
	Severity Severity

	// LintFunc is the function that lints a single configuration.
	LintFunc Function

	// ConditionFuncs is a list of and-conditioned functions that check if the rule should be executed.
	ConditionFuncs []ConditionFunc
}

// Rules is a list of Rule.
type Rules []Rule

// EvalRuleError represents an error that occurred during single rule evaluation.
type EvalRuleError struct {
	// Rule is the rule that caused the error.
	Rule Rule

	// Error is the error that occurred.
	Error error
}

// EvalRuleErrors returns a list of EvalError.
type EvalRuleErrors []EvalRuleError

// EvalResult represents the result of an evaluation for a single configuration.
type EvalResult struct {
	// File is the name of the file that was evaluated against.
	File string

	// Errors is a list of validation errors for each rule.
	Errors EvalRuleErrors
}

// Result is a list of RuleResult.
type Result []EvalResult

// HasErrors returns true if any of the EvalResult has an error.
func (r Result) HasErrors() bool {
	for _, res := range r {
		if res.Errors.WrapErrors() != nil {
			return true
		}
	}
	return false
}

// WrapErrors wraps multiple errors into a single error.
func (e EvalRuleErrors) WrapErrors() error {
	var err *multierror.Error
	for _, e := range e {
		err = multierror.Append(err, e.Error)
	}
	return err.ErrorOrNil()
}
