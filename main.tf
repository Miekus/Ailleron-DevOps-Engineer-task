
resource "azurerm_resource_group" "recruitment-challenge" {
    name     = var.resource-group-name
    location = var.resource-group-location
}

module "Networking" {
    source                  = "./modules/Networking"
    resource-group-name     = azurerm_resource_group.recruitment-challenge.name
    resource-group-location = azurerm_resource_group.recruitment-challenge.location
    security-group-name     = var.security-group-name
    vNet-name               = var.vNet-name
    vNet-address-space      = var.vNet-address-space
    SubNet-name             = var.SubNet-name
    SubNet-address-prefixes   = var.SubNet-address-prefixes
    tag-env                 = var.tag-env
    tag-name                = var.tag-name
}
