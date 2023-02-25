variable "location" {
  type        = string
  description = "Location to launch the infrastructre ex. UK West."
}

variable "resourceGroupName" {
  type        = string
  description = "Name of resource group to use"
}

variable "pubIpName" {
  type = string
}
variable "subnetName" {
  type = string
}
variable "vnetName" {
  type = string
}

variable "tags" {
  type        = map(any)
}

variable "nsgName" {
  type = string
}

variable "nicName" {
  type = string
}

variable "vmName" {
  type = string
}

variable "ssh_key" {
   description = "ssh_key for admin_user"
   # $ export TF_VAR_ssh_key=$( cat ~/.ssh/id_rsa.pub)
}

variable "aksClusterName" {
  type  = string
}
variable "dnsPrefix" {
  type  = string
}

variable "linuxProfileUser" {
  type  = string
}

variable "storageName" {
  type  = string
}
variable "storageContainer" {
  type  = string
}
