variable "tag_env" {}
variable "tag_app" {}
variable "tag_projNum" {}
variable "tag_CostCen" {}
variable "tag_BusUnit" {}

#Project Name variable
variable "ProjectName" {}

#Resource group variables
variable "ResGP_name" {}
variable "ResGP_location" {}

#NIC variables
variable "nic_name" {
  default = "-nic"
}
variable "nic_card" {}
variable "nic_ip_config_name" {
  default = "internal"
}
variable "nic_ip_config_PrivIPAddAlloc" {
  description = "Network card Private IP address allocation"
  type = string
  default = "Dynamic"
}

#OS Image variables
variable "OS_image_name" {}
variable "OS_image_ResGP_name" {}
variable "image_id" {}

#VM server variables
variable "VMserver_name" {}
variable "vm_size" {}
variable "VMServer_CreateOption" {}
variable "os_disk_name" {}
variable "OS_Profile_WindowsConfig" {
  description = "Provision type"
  type = bool
  default =  true
}

#Paging disk variables
variable "p_data_disk_Coption" {}
variable "p_data_disk_name" {}
variable "p_data_disk_size" {}

#Data disk variables
variable "data_disk_Coption" {}
variable "data_disk_name" {}
variable "data_disk_size" {}

#Availability Set variables
variable "vm_availabilty_set_id" {}


variable "VMServer_admin_username" {}
variable "VMServer_admin_password" {}


#VM Extension to join domain
variable "VM_Extension_DomainName" {
  description = "VM extension domain name"
  type = string
  default = "domainjoin"
}
#Publisher
variable "VM_Extension_Publisher" {
  description = "VM Extension Publisher"
  type = string
  default = "Microsoft.Compute"
}
#Type
variable "VM_Extension_Type" {
  description = "VM Extension Type"
  default = "JsonADDomainExtension"
}
#Type Handler Version
variable "VM_Extension_TypeHandler" {
  description = "VM Extension Type Handler"
  type = string
  default = "1.3"
}
variable "domain_password" {}