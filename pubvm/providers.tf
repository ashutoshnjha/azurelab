# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

# Configure the Microsoft Azure Provider
#If you don't have permission to register Resource Providers you may wish to use the
#"skip_provider_registration" flag in the Provider block to disable this functionality.
provider "azurerm" {
  skip_provider_registration = "true"
  features {}
}