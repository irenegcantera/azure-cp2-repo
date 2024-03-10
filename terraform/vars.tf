variable "name_rg" {
  type        = string
  description = "Recurso de grupo de la infraestructura"
  default     = "myResourceGroup"
}

variable "location" {
  type        = string
  description = "Región de Azure donde crearemos la infraestructura"
  default     = "westus2"
}

variable "name_arc" {
  type        = string
  description = "Contenedor de azure registry de la infraestructura"
  default     = "contenedorRegistryPrueba1"
}

variable "name_vnet" {
  type        = string
  description = "Red virtual de la infraestructura"
  default     = "vnet1"
}

variable "name_subnet" {
  type        = string
  description = "Subnet de la infraestructura"
  default     = "subnet1"
}

variable "name_nic" {
  type        = string
  description = "Interfaz de red de la infraestructura"
  default     = "vnic"
}

variable "name_ip" {
  type        = string
  description = "Interfaz de red de la infraestructura"
  default     = "myIp"
}

variable "name_vm" {
  type        = string
  description = "Máquina virtual de la infraestructura"
  default     = "vm1"
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