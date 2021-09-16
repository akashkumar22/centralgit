variable "ResGP_location" {
  description = "(Required) The location where the Network Interface should exist."
}
variable "nic_name" {
  description = "Required) The name of the Network Interface. "
}
variable "ResGP_name" {
  description = "(Required) The name of the Resource Group in which to create the Network Interface."
}
variable "subnet_id" {
  description = "Subnet ID for the Network Interface should use."
}
variable "ip_config_name" {
  description = "(Required) A name used for this IP Configuration."
}
variable "ip_config_priv_ip_alloc" {
  description = "(Required) The allocation method used for the Private IP Address."
}

#Tag variables
variable "tag_env" {}
variable "tag_app" {}
variable "tag_projNum" {}
variable "tag_CostCen" {}
variable "tag_BusUnit" {}