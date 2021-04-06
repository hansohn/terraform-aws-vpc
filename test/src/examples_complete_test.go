package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// Test the Terraform module in examples/complete using Terratest.
func TestExamplesComplete(t *testing.T) {
	t.Parallel()

	terraformOptions := &terraform.Options{
		// The path to where our Terraform code is located
		TerraformDir: "../../examples/complete",
		Upgrade:      true,
		// Variables to pass to our Terraform code using -var-file options
		VarFiles: []string{"fixtures.us-west-1.tfvars"},
	}

	// At the end of the test, run `terraform destroy` to clean up any resources that were created
	defer terraform.Destroy(t, terraformOptions)

	// This will run `terraform init` and `terraform apply` and fail the test if there are any errors
	terraform.InitAndApply(t, terraformOptions)

	// Run `terraform output` to get the value of an output variable
	vpcCidr := terraform.Output(t, terraformOptions, "vpc_cidr")

	expectedVpcCidr := "10.0.0.0/22"
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedVpcCidr, vpcCidr)

	// Run `terraform output` to get the value of an output variable
	privateSubnetCidrs := terraform.OutputList(t, terraformOptions, "private_subnet_cidrs")

	expectedPrivateSubnetCidrs := []string{"10.0.0.0/25", "10.0.0.128/25"}
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedPrivateSubnetCidrs, privateSubnetCidrs)

	// Run `terraform output` to get the value of an output variable
	intraSubnetCidrs := terraform.OutputList(t, terraformOptions, "intra_subnet_cidrs")

	expectedIntraSubnetCidrs := []string{"10.0.1.0/25", "10.0.1.128/25"}
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedIntraSubnetCidrs, intraSubnetCidrs)

	// Run `terraform output` to get the value of an output variable
	publicSubnetCidrs := terraform.OutputList(t, terraformOptions, "public_subnet_cidrs")

	expectedPublicSubnetCidrs := []string{"10.0.2.0/25", "10.0.2.128/25"}
	// Verify we're getting back the outputs we expect
	assert.Equal(t, expectedPublicSubnetCidrs, publicSubnetCidrs)
}
