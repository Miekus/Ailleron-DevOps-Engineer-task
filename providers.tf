terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}
provider "azurerm" {
  skip_provider_registration = true
  features {}
}

# resource "azurerm_storage_account" "example" {
#   name                     = "storageaccountname"
#   resource_group_name      = azurerm_resource_group.example.name
#   location                 = azurerm_resource_group.example.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"

#   tags = {
#     environment = "staging"
#   }
# }

# resource "azurerm_storage_container" "tfstate" {
#   name                  = "tfstate"
#   storage_account_name  = azurerm_storage_account.tfstate.name
#   container_access_type = "blob"
# }