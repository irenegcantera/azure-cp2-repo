
# Caso práctico 2 - Despliegue de infraestructuras sobre proveedor cloud Azure (Terraform y Ansible)

Repositorio donde se almacena los archivos de configuración y contrucción de la infraestructura en el proveedor de Azure. También se almacena los archivos para el despliegue de un servicio web y una aplicación.

A continuación, se indica cómo desplegar manualmente la infraestructura con Terraform y las aplicaciones en el apartado 1 y 2, respectivamente. En el apartado 3 se indica cómo se puede desplegar todo a la vez de forma automática. Se puede usar el método que más os convenga.

## 1. Terraform

Con Terraform se va a crear la infraestructura en el proveedor de Azure. Las infraestructuras que se va a crear en son Azure Container Registry (ACR), Virtual Machine (VM) y Azure Kubernetes Service (AKS).

En el directorio **/terraform** tenemos los siguientes ficheros:

| Archivo        | Descripción                                                    |
| :------------- | :------------------------------------------------------------- |
| `provider.tf`  | Archivo de configuración del proveedor de la infraestructura   |
| `network.tf`   | Archivo de configuración de la red de la máquina virtual       |
| `output.tf`    | Archivo de variables sensitive de salida                       |
| `resources.tf` | Archivo de configuración de los recursos de la infraestructura |
| `security.tf`  | Archivo de configuración de la seguridad de la máquina virtual |
| `vars.tf`      | Archivo de variables globales                                  |

### 1.1. Requirements

| Name                                                                      | Version |
|---------------------------------------------------------------------------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm)       | 3.85.0  |

### 1.2. Providers

| Name                                                          | Version |
|---------------------------------------------------------------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.85.0  |
| <a name="provider_tls"></a> [tls](#provider\_tls)             | 4.0.5   |

### 1.3. Resources

| Name                                                                                                                                              | Type     |
|---------------------------------------------------------------------------------------------------------------------------------------------------|----------|
| [azurerm_container_registry.acr](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/container_registry)              | resource |
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/kubernetes_cluster)              | resource |
| [azurerm_linux_virtual_machine.vm](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/linux_virtual_machine)         | resource |
| [azurerm_network_interface.nic](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/network_interface)                | resource |
| [azurerm_network_interface_security_group_association.secGroupAssociation](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/network_interface_security_group_association)                      | resource |
| [azurerm_network_security_group.secGroup](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/network_security_group) | resource |
| [azurerm_public_ip.ipPublica](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/public_ip)                          | resource |
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/resource_group)                       | resource |
| [azurerm_subnet.subnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/subnet)                                   | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/virtual_network)                   | resource |
| [tls_private_key.ssh_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key)                                | resource |

### 1.4. Inputs

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

### 1.5. Outputs

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

### 1.6. Despliegue de la infraestructura

Inicializa un directorio de trabajo que contiene los archivos de configuración de Terraform. 
```yaml
  terraform init
```
Crea un plan de ejecución para previsualizar los cambios que Terraform planea realizar en su infraestructura. 
```yaml
  terraform plan -out <plan_name>.tfplan
```
Ejecuta las acciones propuestas en un plan de ejecución.
```yaml
  terraform apply <plan_name>.tfplan
```
Ejecuta tras unos minutos el siguiente comando, ya que la IP pública puede tardar en asignarse.
```yaml
  terraform refresh
```
Destruye todos los objetos remotos gestionados.
```yaml
  terraform destroy
```

Genera el gráfico de la infraestructura

https://hieven.github.io/
```yaml
  terraform show -json <plan_name>.tfplan > <plan_name>.json
```

Instala Graphviz en el caso de que lo hayas hecho.
Genera el gráfico de la infraestructura.
```yaml
  sudo apt-get install graphviz
  terraform graph -type=plan | dot -Tpng > <plan_name>.png
  terraform graph | dot -Tsvg > <plan_name>.svg
```

https://terraform-docs.io/
```yaml
curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.17.0/terraform-docs-v0.17.0-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
sudo snap install terraform-docs

```

## 2. Ansible

Con Ansible se va a crear la desplegar un servicio web en la máquina virtual creada con Terraform. A parte se va a desplegar una aplicación en AKS.

En el directorio **/ansible** tenemos los siguientes ficheros:

| Archivo                       | Descripción                |
| :---------------------------- | :------------------------- |
| `deploy_container_podman.yml` | **Required**. Your API key |
| `hosts`                       | **Required**. Your API key |
| `inventory.yml`               | **Required**. Your API key |
| `push_image_registry.yml`     | **Required**. Your API key |
| `setup.yml`                   | **Required**. Your API key |
| `vars.yml`                    | **Required**. Your API key |

Antes de desplegar con Ansible, hay que actualizar los valores de las keys del fichero vars.yml y en inventory.yml debido a que hay keys que se modifican con cada ejecución del plan de la infraestructura de Terraform. Por ejemplo, la IP Pública.

Lanzar los siguientes comandos para obtener los valores (si no se ha modificado el username no será necesario lanzar el primer y segundo comando):
```yaml
terraform output acr_server_registry
terraform output acr_username
terraform output acr_password
terraform output vm_public_ip
```
Despúes, modificar el archivo vars.yml y inventory.yml con los valores devueltos.

### 2.1. Despliegue del servicio y aplicación

Ejecuta el playbook setup.yml para instalar Podman en la máquina virtual de Azure.
```yaml
  ansible-playbook -i inventory.yml setup.yml
```
Ejecuta el playbook push_image_registry.yml para descargar la imagen Apache y la base de datos MySQL. Las imágenes se subirán al contendor registry creado en Azure.
```yaml
  ansible-playbook -i inventory.yml push_images_registry.yml
```
Ejecuta el playbook deploy_container_podman.yml para descagar la imagen subida anteriormente y desplegar el contenedor de Apache server.
```yaml
  ansible-playbook -i inventory.yml deploy_container_podman.yml
```
