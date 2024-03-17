## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.85.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.85.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/container_registry) | resource |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/network_interface) | resource |
| [azurerm_network_interface_security_group_association.sga](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/network_interface_security_group_association) | resource |
| [azurerm_network_security_group.sg](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.ip](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/public_ip) | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azurerc_name"></a> [azurerc\_name](#input\_azurerc\_name) | Nombre del contenedor de azure registry de la infraestructura | `string` | `"arcIrene"` | no |
| <a name="input_domain_ip_name"></a> [domain\_ip\_name](#input\_domain\_ip\_name) | Nombre de la etiqueta dominio de la IP pública | `string` | `"domain-irene"` | no |
| <a name="input_ip_name"></a> [ip\_name](#input\_ip\_name) | Interfaz de red de la infraestructura | `string` | `"ipIrene"` | no |
| <a name="input_location"></a> [location](#input\_location) | Región de Azure donde crearemos la infraestructura | `string` | `"westus2"` | no |
| <a name="input_net_interface_name"></a> [net\_interface\_name](#input\_net\_interface\_name) | Interfaz de red de la infraestructura | `string` | `"vnicIrene"` | no |
| <a name="input_public_key_path"></a> [public\_key\_path](#input\_public\_key\_path) | Ruta para la clave pública de acceso a las instancias | `string` | `"/home/irene/.ssh/id_rsa.pub"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Nombre del recurso de grupo de la infraestructura | `string` | `"resourceGroupIrene"` | no |
| <a name="input_ssh_user"></a> [ssh\_user](#input\_ssh\_user) | Usuario para hacer ssh | `string` | `"azureuser"` | no |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Subnet de la infraestructura | `string` | `"subnetIrene"` | no |
| <a name="input_virtual_machine_name"></a> [virtual\_machine\_name](#input\_virtual\_machine\_name) | Máquina virtual de la infraestructura | `string` | `"vmIrene"` | no |
| <a name="input_virtual_net_name"></a> [virtual\_net\_name](#input\_virtual\_net\_name) | Red virtual de la infraestructura | `string` | `"vnetIrene"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_password"></a> [acr\_password](#output\_acr\_password) | n/a |
| <a name="output_acr_server_registry"></a> [acr\_server\_registry](#output\_acr\_server\_registry) | n/a |
| <a name="output_acr_username"></a> [acr\_username](#output\_acr\_username) | n/a |
| <a name="output_client_certificate_aks"></a> [client\_certificate\_aks](#output\_client\_certificate\_aks) | n/a |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
| <a name="output_vm_public_ip"></a> [vm\_public\_ip](#output\_vm\_public\_ip) | n/a |
