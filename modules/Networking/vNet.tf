resource "azurerm_virtual_network" "recruitment-vnet" {
    name                = var.vNet-name
    location            = var.resource-group-location
    resource_group_name = var.resource-group-name
    address_space       = [var.vNet-address-space]

    tags = {
        env  = var.tag-env
        name = var.tag-name
    }
}

resource "azurerm_subnet" "recruitment-subnet" {
    name                 = var.SubNet-name
    resource_group_name  = var.resource-group-name
    virtual_network_name = azurerm_virtual_network.recruitment-vnet.name
    address_prefixes     = [var.SubNet-address-prefixes]
}

resource "azurerm_network_security_group" "recruitment-security-group" {
    name                = var.security-group-name
    location            = var.resource-group-location
    resource_group_name = var.resource-group-name

    tags = {
        env  = var.tag-env
        name = var.tag-name
    }
}

resource "azurerm_subnet_network_security_group_association" "recruitment-subnet-sg-association" {
  subnet_id                 = azurerm_subnet.recruitment-subnet.id
  network_security_group_id = azurerm_network_security_group.recruitment-security-group.id
}