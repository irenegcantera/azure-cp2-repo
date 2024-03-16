# Creación de red
resource "azurerm_virtual_network" "vnet" {
  name                = var.name_vnet
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

# Creación de subnet
resource "azurerm_subnet" "subnet" {
  name                 = var.name_subnet
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.2.0/24"]
}

# Creación NIC
resource "azurerm_network_interface" "nic" {
  name                = var.name_nic
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.ipPublica.id
  }
}

#  Creación IP Pública
resource "azurerm_public_ip" "ipPublica" {
  name                = var.name_ip
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  domain_name_label   = var.domain_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

