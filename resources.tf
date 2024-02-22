# Creacion del recurso de grupo
resource "azurerm_resource_group" "rg" {
  name     = "myResourceGroup"
  location = "westus2"
}

# Creacion del recurso ACR
resource "azurerm_container_registry" "acr" {
  name                = "contenedorRegistryPrueba1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = false
}
