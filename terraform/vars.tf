variable "resource_group_name" {
  type        = string
  description = "Nombre del recurso de grupo de la infraestructura"
  default     = "resourceGroupIrene"
}

variable "location" {
  type        = string
  description = "Región de Azure donde crearemos la infraestructura"
  default     = "westus2"
}

variable "azurerc_name" {
  type        = string
  description = "Nombre del contenedor de azure registry de la infraestructura"
  default     = "arcIrene"
}

variable "virtual_net_name" {
  type        = string
  description = "Red virtual de la infraestructura"
  default     = "vnetIrene"
}

variable "subnet_name" {
  type        = string
  description = "Subnet de la infraestructura"
  default     = "subnetIrene"
}

variable "net_interface_name" {
  type        = string
  description = "Interfaz de red de la infraestructura"
  default     = "vnicIrene"
}

variable "ip_name" {
  type        = string
  description = "Interfaz de red de la infraestructura"
  default     = "ipIrene"
}

variable "domain_ip_name" {
  type = string
  description = "Nombre de la etiqueta dominio de la IP pública"
  default = "domain-irene"
}

variable "virtual_machine_name" {
  type        = string
  description = "Máquina virtual de la infraestructura"
  default     = "vmIrene"
}

variable "public_key_path" {
  type        = string
  description = "Ruta para la clave pública de acceso a las instancias"
  default     = "/home/irene/.ssh/id_rsa.pub"
}

variable "ssh_user" {
  type        = string
  description = "Usuario para hacer ssh"
  default     = "azureuser"
}
