
# Caso práctico 2 - Automatización de despliegue de infraestructuras en el entorno cloud Azure (Terraform y Ansible)

Repositorio donde se almacena los archivos de configuración y contrucción de la infraestructura en el proveedor de Azure. También se almacena los archivos para el despliegue de un servicio web y una aplicación.

A continuación, se indica cómo desplegar manualmente la infraestructura con Terraform y las aplicaciones en el apartado 1 y 2, respectivamente. En el apartado 3 se indica cómo se puede desplegar todo a la vez de forma automática. Se puede usar el método que más os convenga.

## 1. Terraform

Con Terraform se va a crear la infraestructura en el proveedor de Azure. Las infraestructuras que se va a crear en son Azure Container Registry (ACR), Virtual Machine (VM) y Azure Kubernetes Service (AKS).

En el directorio **/terraform** tenemos los siguientes ficheros:

| Archivo        | Descripción                                                    |
| :------------- | :------------------------------------------------------------- |
| `provider.tf`  | Archivo de configuración del proveedor de la infraestructura   |
| `network.tf`   | Archivo de configuración de la red de la máquina virtual       |
| `outputs.tf`   | Archivo de variables sensitive de salida                       |
| `recursos.tf`  | Archivo de configuración de los recursos de la infraestructura |
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

### 1.3. Resources

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
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.85.0/docs/resources/virtual_network) | resource |                             | resource |

### 1.4. Inputs

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

### 1.5. Outputs

| Name | Description |
|------|-------------|
| <a name="output_acr_password"></a> [acr\_password](#output\_acr\_password) | n/a |
| <a name="output_acr_server_registry"></a> [acr\_server\_registry](#output\_acr\_server\_registry) | n/a |
| <a name="output_acr_username"></a> [acr\_username](#output\_acr\_username) | n/a |
| <a name="output_client_certificate_aks"></a> [client\_certificate\_aks](#output\_client\_certificate\_aks) | n/a |
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
| <a name="output_vm_public_ip"></a> [vm\_public\_ip](#output\_vm\_public\_ip) | n/a |

### 1.6. Despliegue de la infraestructura

Antes de desplegar la infraestructura hay que iniciar sesión en el proveedor con Azure CLI y guardarnos el ID de la subscrición para crear un Service Principal. 
```yaml
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SUBSCRIPTION_ID>"
```
Después de crear ese Service Principal obtendremos unas credenciales que serán usadas por Terraform para conectarse a Azure. Añadimos esas credenciales como variables de entorno:
```yaml
export ARM_CLIENT_ID="<APPID_VALUE>"
export ARM_CLIENT_SECRET="<PASSWORD_VALUE>"
export ARM_SUBSCRIPTION_ID="<SUBSCRIPTION_ID>"
export ARM_TENANT_ID="<TENANT_VALUE>"
```
Inicializa un directorio de trabajo que contiene los archivos de configuración de Terraform. 
```yaml
  terraform init
```
Comprobar que los archivos de configuración presentan el formato correcto y si la configuración es válida.
```yaml
  terraform fmt
  terraform validate
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
Genera el gráfico de la infraestructura en la carpeta **/charts/**. Después de ejecutar el siguiente comando sube el archivo JSON generado en la siguiente página web https://hieven.github.io/terraform-visual/
```yaml
  terraform show -json <plan_name>.tfplan > ../charts/<plan_name>.json
```
Instala Graphviz en el caso de que lo hayas hecho.
```yaml
  sudo apt-get install graphviz
```
Genera el gráfico de la infraestructura.
```yaml
  terraform graph -type=plan | dot -Tpng > ../charts/<plan_name>.png
  terraform graph | dot -Tsvg > ../charts/<plan_name>.svg
```
Genera la documentación de la infraestructura desplegada con Terraform.
https://terraform-docs.io/
```yaml
curl -sSLo ./terraform-docs.tar.gz https://terraform-docs.io/dl/v0.17.0/terraform-docs-v0.17.0-$(uname)-amd64.tar.gz
tar -xzf terraform-docs.tar.gz
sudo snap install terraform-docs
terraform-docs markdown table . > markdown_table.md
```

## 2. Ansible

Con Ansible se va a crear la desplegar un servicio web en la máquina virtual creada con Terraform. A parte se va a desplegar una aplicación en AKS.

En el directorio **/ansible** tenemos los siguientes ficheros:

| Archivo                       | Descripción                |
| :---------------------------- | :------------------------- |
| `deploy_container_podman.yml` | N/A |
| `hosts`                       | N/A |
| `inventory.yml`               | N/A |
| `push_images_registry.yml`    | N/A |
| `setup.yml`                   | N/A |
| `vars.yml`                    | N/A |

Antes de desplegar con Ansible, hay que actualizar los valores de las keys del fichero vars.yml e en inventory.yml debido a que hay keys que se modifican con cada ejecución del plan de la infraestructura de Terraform. Por ejemplo, la IP Pública.

Lanzar los siguientes comandos para obtener los valores (si no se ha modificado el username no será necesario lanzar el primer ni el segundo comando):
```yaml
terraform output acr_server_registry
terraform output acr_username
terraform output acr_password
terraform output vm_public_ip
```
Despúes, modificar el archivo vars.yml e inventory.yml con los valores devueltos.

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
