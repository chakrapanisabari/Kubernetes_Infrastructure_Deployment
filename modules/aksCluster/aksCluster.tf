resource "azurerm_kubernetes_cluster" "hexpoc" {
  name                = var.aksName
  location            = var.location
  resource_group_name = var.resourceGroupName
  dns_prefix          = var.dnsPrefix

default_node_pool {
    name            = "default"
    node_count      = 3
    vm_size         = var.vmSize
    type            = "VirtualMachineScaleSets"
    os_disk_size_gb = var.osDiskSizeGB
}

service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
}   

network_profile {
    load_balancer_sku = "Standard"
    network_plugin = "kubenet"
}

addon_profile{
    aci_connector_linux{
        enabled = false
    }

    azure_policy{
        enabled = false
    }

    http_application_routing{
        enabled = true
    }

    oms_agent{
        enabled = false
    }
}
}
