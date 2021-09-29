#Project Name variable
variable "ProjectName" {}

#Resource group variables
variable "ResGP_name" {}
variable "ResGP_location" {}

#NSG variables
variable "basic_nsg_name" {}
variable "sec_rule_name" {}
variable "sec_rule_priority" {}
variable "sec_rule_direction" {}
variable "sec_rule_access" {}
variable "sec_rule_protocol" {}
variable "sec_rule_source_port_range" {}
variable "sec_rule_destination_port_range" {}
variable "sec_rule_source_address_prefixes" {}
variable "sec_rule_destination_address_prefix" {}

#Virtual Network variables
variable "vnet_ResGP_name" {}
variable "vnet_name" {}

#Subnet variables
variable "subnet_name" {}
variable "subnet_ResGP_name" {}
variable "subnet_vnet_name" {}

#Tag variables
variable "tag_env" {}
variable "tag_app" {}
variable "tag_CostCen" {}
variable "tag_BusUnit" {}
variable "tag_projNum" {}


#Availability set variables
variable "avail_set_name" {}

#NIC variables
#NIC1
variable "nic_name" {
  default = "-Nic"
}
variable "nic_ip_config_name" {
  default = "internal"
}
variable "nic_ip_config_PrivIPAddAlloc" {
  description = "Network card Private IP address allocation"
  type = string
  default = "Dynamic"
}
#NIC2
variable "nic2_name" {
  default = "-Nic"
}
variable "nic2_ip_config_name" {
  default = "internal"
}
variable "nic2_ip_config_PrivIPAddAlloc" {
  description = "Network card Private IP address allocation"
  type = string
  default = "Dynamic"
}


#OS Image variables
variable "OS_image_name" {}
variable "OS_image_ResGP_name" {}


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
variable "VMServer_admin_username" {}
variable "VMServer_admin_password" {}

#Paging disk variables
variable "p_data_disk_Coption" {}
variable "p_data_disk_name" {}
variable "p_data_disk_size" {}

#Data Disk variables
variable "data_disk_Coption" {}
variable "data_disk_name" {}
variable "data_disk_size" {}

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

#VM2 server variables
variable "VMserver2_name" {}
variable "vm2_size" {}
variable "VMServer2_CreateOption" {}
variable "os2_disk_name" {}
variable "OS2_Profile_WindowsConfig" {
  description = "Provision type"
  type = bool
  default =  true
}
variable "VMServer2_admin_username" {}
variable "VMServer2_admin_password" {}

#Data Disk variables
variable "data2_disk_Coption" {}
variable "data2_disk_name" {}
variable "data2_disk_size" {}

#VM Extension to join domain
variable "VM2_Extension_DomainName" {
  description = "VM extension domain name"
  type = string
  default = "domainjoin2"
}
#Publisher
variable "VM2_Extension_Publisher" {
  description = "VM Extension Publisher"
  type = string
  default = "Microsoft.Compute"
}
#Type
variable "VM2_Extension_Type" {
  description = "VM Extension Type"
  default = "JsonADDomainExtension"
}
#Type Handler Version
variable "VM2_Extension_TypeHandler" {
  description = "VM Extension Type Handler"
  type = string
  default = "1.3"
}

#Load Balancer variables
variable "lb_location" {}
variable "lb_name" {}
variable "lb_ResGP_name" {}
variable "lb_allocation_method" {}
variable "lb_public_name" {}
variable "lb_front_ip_config_name" {}

#Storage Account variables
variable "SA_replicationType" {
  description = "(Required) Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
  default = "LRS"
}
variable "SA_AccountTier" {
  description = "(Required) Defines the Tier to use for this storage account."
}
variable "SA_AccessTier" {
  description = "(Optional) Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot."
}
variable "SA_AccountKind" {
  description = "(Optional) Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2. Changing this forces a new resource to be created. Defaults to StorageV2."
}