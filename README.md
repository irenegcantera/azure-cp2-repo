
# Caso práctico 2 - Despliegue de infraestructuras sobre proveedor cloud Azure (Terraform y Ansible)

Repositorio donde se almacena los archivos de configuración y contrucción de la infraestructura en el proveedor de Azure. También se almacena los archivos para el despliegue de un servicio web y una aplicación.

A continuación, se indica cómo desplegar manualmente la infraestructura con Terraform y las aplicaciones en el apartado 1 y 2, respectivamente. En el apartado 3 se indica cómo se puede desplegar todo a la vez de forma automática. Se puede usar el método que más os convenga.

## 1. Terraform

Con Terraform se va a crear la infraestructura en el proveedor de Azure. La infraestructura que se va a crear en ACR, VM y AKS.

En el directorio **/terraform** tenemos los siguientes ficheros:

| Archivo        | Descripción                                                    |
| :------------- | :------------------------------------------------------------- |
| `provider.tf`  | Archivo de configuración del proveedor de la infraestructura   |
| `network.tf`   | Archivo de configuración de la red de la máquina virtual       |
| `output.tf`    | Archivo de variables sensitive de salida                       |
| `resources.tf` | Archivo de configuración de los recursos de la infraestructura |
| `security.tf`  | Archivo de configuración de la seguridad de la máquina virtual |
| `vars.tf`      | Archivo de variables globales                                  |

### 1.1. Despliegue de la infraestructura

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
Ejecuta el playbook push_image_registry.yml para descargar la imagen Apache server y subirla al contendor registry creado en Azure.
```yaml
  ansible-playbook -i inventory.yml push_image_registry.ym
```
Ejecuta el playbook deploy_container_podman.yml para descagar la imagen subida anteriormente y desplegar el contenedor de Apache server.
```yaml
  ansible-playbook -i inventory.yml deploy_container_podman.yml
```
## 3. Despliegue automatizado

Lanza el script deploy.sh