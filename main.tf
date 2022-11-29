
resource "azurerm_resource_group" "recruitment-challenge" {
    name     = var.resource-group-name
    location = var.resource-group-location
}

#I don't know how to test it without loging to cli so this is only test "template". I will be happy if you can correct me with this module
module "Storage" {
    source                          = "./modules/Networking"
    #Resource group
    resource-group-name             = azurerm_resource_group.recruitment-challenge.name
    resource-group-location         = azurerm_resource_group.recruitment-challenge.location
    #Storage account
    storage-account-name            = var.storage-account-name
    account-tier                    = var.account-tier 
    account-replication-type        = var.account-replication-type
    #Storage container
    storage-container-name          = var.storage-container-name 
    storage-container-access-type   = var.storage-container-access-type
    #Tags
    tag-env                         = var.tag-env
    tag-name                        = var.tag-name
}

module "Networking" {
    source                      = "./modules/Networking"
    #Resource group
    resource-group-name         = azurerm_resource_group.recruitment-challenge.name
    resource-group-location     = azurerm_resource_group.recruitment-challenge.location
    #Security group
    security-group-name         = var.security-group-name
    #vNet
    vNet-name                   = var.vNet-name
    vNet-address-space          = var.vNet-address-space
    #SubNet
    SubNet-name                 = var.SubNet-name
    SubNet-address-prefixes     = var.SubNet-address-prefixes
    #Tags
    tag-env                     = var.tag-env
    tag-name                    = var.tag-name
}

module "Kubernates" {
    depends_on = [
        module.Networking
    ]
    source                              = "./modules/kubernates"
    resource-group-name                 = azurerm_resource_group.recruitment-challenge.name
    resource-group-location             = azurerm_resource_group.recruitment-challenge.location
    vnet-recruitment-subnet-id          = module.Networking.vnet-recruitment-subnet-id
    #AKS
    aks-name                            = var.aks-name
    dns-prefix                          = var.dns-prefix
    identity-type                       = var.identity-type
    #Network profile
    network-plugin                      = var.network-plugin
    dns-service-ip                      = var.dns-service-ip
    docker-bridge-cidr                  = var.docker-bridge-cidr
    service-cidr                        = var.service-cidr
    #Auto-scaler profile
    scale-down-utilization-threshold    = var.scale-down-utilization-threshold
    skip-nodes-with-system-pods         = var.skip-nodes-with-system-pods
    skip-nodes-with-local-storage       = var.skip-nodes-with-local-storage
    role-based-access-control           = var.role-based-access-control
    #Node pool
    node-pool-name                      = var.node-pool-name
    node-pool-autoscaling               = var.node-pool-autoscaling 
    node-pool-minimum                   = var.node-pool-minimum 
    node-pool-maximum                   = var.node-pool-maximum
    node-os-disk-size-gb                = var.node-os-disk-size-gb
    node-pool-vm-size                   = var.node-pool-vm-size
    node-pool-zones                     = var.node-pool-zones
    #Tags
    tag-env                             = var.tag-env
    tag-name                            = var.tag-name
}