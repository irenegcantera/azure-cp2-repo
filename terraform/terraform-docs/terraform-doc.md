## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.85.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.85.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/container_registry) | resource |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.secGroupAssociation](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.secGroup](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.ipPublica](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/virtual_network) | resource |
| [tls_private_key.ssh_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | Región de Azure donde crearemos la infraestructura | `string` | `"westus2"` | no |
| <a name="input_name_arc"></a> [name\_arc](#input\_name\_arc) | Contenedor de azure registry de la infraestructura | `string` | `"contenedorRegistryPrueba1"` | no |
| <a name="input_name_ip"></a> [name\_ip](#input\_name\_ip) | Interfaz de red de la infraestructura | `string` | `"myIp"` | no |
| <a name="input_name_nic"></a> [name\_nic](#input\_name\_nic) | Interfaz de red de la infraestructura | `string` | `"vnic"` | no |
| <a name="input_name_rg"></a> [name\_rg](#input\_name\_rg) | Recurso de grupo de la infraestructura | `string` | `"myResourceGroup"` | no |
| <a name="input_name_subnet"></a> [name\_subnet](#input\_name\_subnet) | Subnet de la infraestructura | `string` | `"subnet1"` | no |
| <a name="input_name_vm"></a> [name\_vm](#input\_name\_vm) | Máquina virtual de la infraestructura | `string` | `"vm1"` | no |
| <a name="input_name_vnet"></a> [name\_vnet](#input\_name\_vnet) | Red virtual de la infraestructura | `string` | `"vnet1"` | no |
| <a name="input_public_key_path"></a> [public\_key\_path](#input\_public\_key\_path) | Ruta para la clave pública de acceso a las instancias | `string` | `"/home/irene/.ssh/id_rsa.pub"` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | Usuario para hacer ssh | `string` | `"azureuser"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_password"></a> [acr\_password](#output\_acr\_password) | n/a |
| <a name="output_acr_server_registry"></a> [acr\_server\_registry](#output\_acr\_server\_registry) | n/a |
| <a name="output_acr_username"></a> [acr\_username](#output\_acr\_username) | n/a |
| <a name="output_client_certificate_aks"></a> [client\_certificate\_aks](#output\_client\_certificate\_aks) | n/a |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
| <a name="output_ssh_private_key"></a> [ssh\_private\_key](#output\_ssh\_private\_key) | n/a |
| <a name="output_ssh_public_key"></a> [ssh\_public\_key](#output\_ssh\_public\_key) | n/a |
| <a name="output_vm_public_ip"></a> [vm\_public\_ip](#output\_vm\_public\_ip) | n/a |