package test

import (
	"fmt"
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestAccIBMCloudFunction(t *testing.T) {
	t.Parallel()

	// Construct the terraform options with default retryable errors to handle the most common retryable errors in
	// terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../examples/cloud-function",

		Vars: map[string]interface{}{
			"resource_group":                   "Default",
			"action_name":                      "cf-action2",
			"namespace_name":                   "cf-namespace",
			"provision_namespace":              true,
			"create_package":                   true,
			"package_name":                     "newPackage",
			"package_publish":                  false,
			"package_user_defined_annotations": "[]",
			"package_user_defined_parameters":  "[]",
			"action_exec": []map[string]interface{}{
				{
					"main": "main",
					"kind": "python:3.7",
				},
			},
			"trigger_feed": []map[string]string{
				{
					"name": "/whisk.system/alarms/alarm",
					"parameters": fmt.Sprintf("${%q}", `[{
                        "key" : "cron",
                        "value" : "* * * * *"
                    }]`),
				},
			},
			"action_user_defined_annotations":  "[]",
			"action_user_defined_parameters":   "[]",
			"trigger_name":                     "cf-trigger2",
			"trigger_user_defined_annotations": "[]",
			"trigger_user_defined_parameters":  "[]",
			"rule_name":                        "cf-rule",
		},
	})

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)
}
