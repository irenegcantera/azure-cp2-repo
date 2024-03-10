# Creacion del recurso de grupo
resource "azurerm_resource_group" "rg" {
  name     = var.name_rg
  location = var.location

  tags = {
    environment = "caso-practico-2"
  }
}

# Creacion del recurso ACR
resource "azurerm_container_registry" "acr" {
  name                = var.name_arc
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Premium"
  admin_enabled       = false
}

# Creacion del recurso vm de linux
resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.name_vm
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = "Standard_B1s"
  admin_username      = var.ssh_user
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]

  admin_ssh_key {
    username   = var.ssh_user
    public_key = file(var.public_key_path) #tls_private_key.ssh_key.public_key_openssh
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Debian"
    offer     = "debian-11"
    sku       = "11-backports-gen2"
    version   = "latest"
  }
}

# Creación AKS
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-dns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "caso-practico-2"
  }
}