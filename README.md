
# Caso práctico 2 - Terraform y Ansible

Repositorio donde se almacena los archivos de configuración y contrucción de la infraestructura en el proveedor de Azure. También se almacena los archivos para el despliegue de un servicio web y una aplicación.

## Terraform

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

### Despliegue de la infraestructura

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

## Ansible

Con Ansible se va a crear la desplegar un servicio web en la máquina virtual creada con Terraform. A parte se va a desplegar una aplicación en AKS.

En el directorio **/ansible** tenemos los siguientes ficheros:

| Archivo                | Descripción                |
| :--------------------- | :------------------------- |
| `deploy_container.yml` | **Required**. Your API key |
| `hosts`                | **Required**. Your API key |
| `install_podman.yml`   | **Required**. Your API key |
| `inventory.yml`        | **Required**. Your API key |
| `vars.yml`             | **Required**. Your API key |

```yaml
  ansible-playbook
```
