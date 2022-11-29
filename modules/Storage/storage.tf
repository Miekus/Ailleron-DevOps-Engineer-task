resource "azurerm_storage_account" "storage-account" {
    name                     = var.storage-account-name
    resource_group_name      = var.resource-group-name
    location                 = var.resource-group-location
    account_tier             = var.account-tier
    account_replication_type = var.account-replication-type

    tags = {
        env  = var.tag-env
        name = var.tag-name
    }
}

resource "azurerm_storage_container" "tfstate-storage-container" {
    name                  = var.storage-container-name
    storage_account_name  = azurerm_storage_account.storage-account.name
    container_access_type = var.storage-container-access-type
}