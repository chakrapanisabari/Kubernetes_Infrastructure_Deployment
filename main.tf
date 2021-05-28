provider "azurerm"{
    version = "=2.46.0"	
	features {}
}

module "containerRegistry"{
    source                = "./modules/containerRegistry/"
    containerRegistryName = var.containerRegistryName
    acrsku                = var.acrsku
    resourceGroupName     = var.resourceGroupName
    location              = var.location
}

module "aksCluster"{
    source                = "./modules/aksCluster/"
    aksName               = var.aksName
    location              = var.location
    resourceGroupName     = var.resourceGroupName
    dnsPrefix             = var.dnsPrefix
    vmSize                = var.vmSize
    osDiskSizeGB          = var.osDiskSizeGB
    client_id             = var.client_id
    client_secret         = var.client_secret
}



