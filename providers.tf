terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
    backend "azurerm" { // variables are not allowed here?
      resource_group_name  = "recruitment-challenge"
      storage_account_name = "storageaccount"
      container_name       = "Tfstate"
      key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  skip_provider_registration = true
  features {}
}
