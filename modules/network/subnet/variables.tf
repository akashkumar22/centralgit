variable "subnet_name" {}
variable "ResGP_name" {
  description = "(Required) The Name which should be used for this Resource Group."
}
variable "vnet_name" {
  description = "Specifies the name of the Virtual Network."
}
variable "vnet_subnet_address_prefix" {}