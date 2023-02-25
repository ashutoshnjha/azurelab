# How I progrressed.
Step 1)
add providers.tf to have provier information block from https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

Step 2 ) added resource group in a separate template by referring https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
 here values for location and resource name are from variable file.

 Intro
 Using variables in resources
The values defined in the variables.tf files can be used in the Terraform plans to avoid hard-coding parameters.

Terraform implicitly loads a number of variable definitions files if named terraform.tfvars or terraform.tfvars.json.


After terraform apply

run terraform output tls_private_key to get pvt key and save in a file
to connect use ssh -i /path/to/abovefiel superaj@ip_address of vm