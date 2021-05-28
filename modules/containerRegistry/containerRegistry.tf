resource "azurerm_container_registry" "hexpoc" {
  name                     = var.containerRegistryName
  resource_group_name      = var.resourceGroupName
  location                 = var.location
  sku                      = var.acrsku
  admin_enabled            = true
}