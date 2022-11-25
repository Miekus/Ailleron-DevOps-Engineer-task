resource "azurerm_kubernetes_cluster" "recruitment-aks" {
    name                   = var.aks-name
    location               = var.resource-group-location
    resource_group_name    = var.resource-group-name
    dns_prefix             = var.dns-prefix

    network_profile {
        network_plugin     = var.network-plugin
        dns_service_ip     = var.dns-service-ip
        docker_bridge_cidr = var.docker-bridge-cidr
        service_cidr       = var.service-cidr
    }

    azure_active_directory_role_based_access_control {
        managed                = true
        azure_rbac_enabled     = var.role-based-access-control
    }

  default_node_pool {
        name               = "default"
        node_count         = var.node-pool-minimum
        vm_size            = var.node-pool-vm-size
    }

    identity {
        type               = var.identity-type
    }
    auto_scaler_profile {
        scale_down_utilization_threshold    = var.scale-down-utilization-threshold
        skip_nodes_with_system_pods         = var.skip-nodes-with-system-pods
        skip_nodes_with_local_storage       = var.skip-nodes-with-local-storage
    }

    tags = {
        env  = var.tag-env
        name = var.tag-name
    }
}

resource "azurerm_kubernetes_cluster_node_pool" "recruitment-cluster-node-pool" {
    name                   = var.node-pool-name
    kubernetes_cluster_id  = azurerm_kubernetes_cluster.recruitment-aks.id
    vm_size                = var.node-pool-vm-size
    vnet_subnet_id         = var.vnet-recruitment-subnet-id
    enable_auto_scaling    = var.node-pool-autoscaling
    min_count              = var.node-pool-minimum
    max_count              = var.node-pool-maximum
    os_disk_size_gb        = var.node-os-disk-size-gb
    zones                  = var.node-pool-zones

    tags = {
        env  = var.tag-env
        name = var.tag-name
    }
}