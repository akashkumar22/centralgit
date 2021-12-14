provider "azurerm" {
  subscription_id = "1a3a1d6b-7b2a-409c-964e-f89cd4487b9d"
  features {}
}

data "azurerm_resource_group" "ResGP" {
  name = var.ResGP_name
}

#Lookup image
data azurerm_image "image_name" {
  resource_group_name = var.OS_image_ResGP_name
  name = "MHESvr2K19Std"
}
output "image_id" {
  value = data.azurerm_image.image_name.id
}

#Create Network Security Group
module "NSG_ProjName" {
  depends_on = [module.VMserver]
  source = "./modules/network/network_security_group"
  ResGP_name = data.azurerm_resource_group.ResGP.name
  basic_nsg_name = var.basic_nsg_name

  tag_app = var.tag_app
  tag_env = var.tag_env
  tag_BusUnit = var.tag_BusUnit
  tag_CostCen = var.tag_CostCen
  tag_projNum = var.tag_projNum
}
#Create Network Security Rules SNOW
module "NSR_SNOW" {
  depends_on = [module.VMserver]
  source = "./modules/network/NSR_SNOW"
  NSG_name   = module.NSG_ProjName.nsg_out_name
  ResGP_name = var.ResGP_name
}
#Create Network Security Rule WSUS
module "NSR_WSUS" {
  depends_on = [module.VMserver]
  source = "./modules/network/NSR_WSUS"
  NSG_name   = module.NSG_ProjName.nsg_out_name
  ResGP_name = var.ResGP_name
}
#Create Network Security Rule KMS
module "NSR_KMS" {
  depends_on = [module.VMserver]
  source = "./modules/network/NSR_KMS"
  NSG_name   = module.NSG_ProjName.nsg_out_name
  ResGP_name = var.ResGP_name
}
#Create Network Security Rule MicroFocus
module "NSR_MicroFocus" {
  depends_on = [module.VMserver]
  source = "./modules/network/NSR_Microfocus"
  NSG_name   = module.NSG_ProjName.nsg_out_name
  ResGP_name = var.ResGP_name
}
#Create Network Security Rule AdminCenter
module "NSR_AdminCenter" {
  depends_on = [module.VMserver]
  source = "./modules/network/NSR_AdminCenter"
  NSG_name   = module.NSG_ProjName.nsg_out_name
  ResGP_name = var.ResGP_name
}
#Create Network Security Rule ICMP for DCs
module "NSR_ICMPforDCs" {
  depends_on = [module.VMserver]
  source = "./modules/network/NSR_ICMPforDCs"
  NSG_name   = module.NSG_ProjName.nsg_out_name
  ResGP_name = var.ResGP_name
}
#Create Network Security Rule AutoAny SQL
resource azurerm_network_security_rule "AA_SQL_1433" {
  depends_on = [module.VMserver]

  access                          = "Allow"
  direction                       = "Outbound"
  name                            = "AA_SQL_1433"
  network_security_group_name     = module.NSG_ProjName.nsg_out_name
  priority                        = 100
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "1433"
  source_address_prefix           = "*"
  destination_address_prefix      = "VirtualNetwork"
  description                     = "SQL TCP port 1433 outbound for any virtual netowrk."
}
#Create Network Security Rule Port 11000-11999
resource azurerm_network_security_rule "AA_11000-11999" {
  access                          = "Allow"
  direction                       = "Outbound"
  name                            = "AA_11000-11999"
  network_security_group_name     = module.NSG_ProjName.nsg_out_name
  priority                        = 101
  protocol                        = "*"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "11000-11999"
  source_address_prefix           = "*"
  destination_address_prefix      = "*"
  description                     = "TBD"
}
#Create Network Security Rule Port 14000-14999
resource azurerm_network_security_rule "AA_14000-14999" {
  access                          = "Allow"
  direction                       = "Outbound"
  name                            = "AA_14000-14999"
  network_security_group_name     = module.NSG_ProjName.nsg_out_name
  priority                        = 102
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "14000-14999"
  source_address_prefix           = "*"
  destination_address_prefix      = "*"
  description                     = "TBD"
}
#Create Network Security Rule Port 1434
resource azurerm_network_security_rule "AA_SQL_1434" {
  access                          = "Allow"
  direction                       = "Outbound"
  name                            = "AA_SQL_1434"
  network_security_group_name     = module.NSG_ProjName.nsg_out_name
  priority                        = 103
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "1434"
  source_address_prefix           = "*"
  destination_address_prefix      = "*"
  description                     = "TBD"
}
#Create NSR port 8080
resource azurerm_network_security_rule "AA_TCP_In8080" {
  access                            = "Allow"
  direction                         = "Inbound"
  name                              = "AA_TCP_In8080"
  network_security_group_name       = module.NSG_ProjName.nsg_out_name
  priority                          = 125
  protocol                          = "TCP"
  resource_group_name               = var.ResGP_name
  source_port_range                 = "*"
  destination_port_range            = "8080"
  source_address_prefixes           = ["10.112.0.0/16", "10.213.0.0/16", "10.212.0.0/16","10.152.0.0/16","10.229.0.0/16"]
  destination_address_prefix      = "*"
  description                       = "TCP Port 8080 for Auto Any Portal"
}
#Create NSR port Outbound 8080
resource azurerm_network_security_rule "AA_TCP_Out8080" {
  access                            = "Allow"
  direction                         = "Outbound"
  name                              = "AA_TCP_Out8080"
  network_security_group_name       = module.NSG_ProjName.nsg_out_name
  priority                          = 126
  protocol                          = "TCP"
  resource_group_name               = var.ResGP_name
  source_port_range                 = "*"
  destination_port_range            = "8080"
  source_address_prefix             = "*"
  destination_address_prefixes      = ["10.112.0.0/16", "10.213.0.0/16", "10.212.0.0/16","10.152.0.0/16","10.229.0.0/16"]
  description                       = "TCP Port 8080 for Auto Any Portal"
}


#Create Availability Set
module "avail_set" {
  source = "./modules/compute/availability_set"
  ProjectName = var.ProjectName
  ResGP_name = var.ResGP_name
  avail_set_name = var.avail_set_name
   ResGP_location = var.ResGP_location

  tag_app = var.tag_app
  tag_env = var.tag_env
  tag_BusUnit = var.tag_BusUnit
  tag_CostCen = var.tag_CostCen
  tag_projNum = var.tag_projNum

//  depends_on = [data.ResGP]

}
output "avail_set_id" {
  value = module.avail_set.avail_set_id_out
}

#Find Virtual Network
data  azurerm_virtual_network "vnet" {
  name = var.vnet_name
  resource_group_name = var.vnet_ResGP_name
}

#Find Subnet
data azurerm_subnet "subnet"{
  name = var.subnet_name
  resource_group_name = var.subnet_ResGP_name
  virtual_network_name = var.subnet_vnet_name
}
output "subnet_id" {
  value = data.azurerm_subnet.subnet.id
}

#Create NIC card
#NIC1
module "NIC" {
  source = "./modules/network/network_interface_card"
  ResGP_location = var.ResGP_location
  ResGP_name = var.ResGP_name
  ip_config_name = var.nic_ip_config_name
  ip_config_priv_ip_alloc = var.nic_ip_config_PrivIPAddAlloc
  nic_name = "${var.VMserver_name}${var.nic_name}"
  subnet_id = data.azurerm_subnet.subnet.id
  tag_app = var.tag_app
  tag_env = var.tag_env
  tag_BusUnit = var.tag_BusUnit
  tag_CostCen = var.tag_CostCen
  tag_projNum = var.tag_projNum

//  depends_on = [module.ResGP, ]
}
#NIC2
module "NIC2" {
  source = "./modules/network/network_interface_card"
  ResGP_location = var.ResGP_location
  ResGP_name = var.ResGP_name
  ip_config_name = var.nic2_ip_config_name
  ip_config_priv_ip_alloc = var.nic2_ip_config_PrivIPAddAlloc
  nic_name = "${var.VMserver2_name}${var.nic_name}"
  subnet_id = data.azurerm_subnet.subnet.id
  tag_app = var.tag_app
  tag_env = var.tag_env
  tag_BusUnit = var.tag_BusUnit
  tag_CostCen = var.tag_CostCen
  tag_projNum = var.tag_projNum

//  depends_on = [data.ResGP, ]
}


#Create VM server
#VM Server1
module "VMserver" {
  source = "./modules/compute/virtual_machine"
  OS_image_ResGP_name = var.OS_image_ResGP_name
  OS_image_name = var.OS_image_name
  ProjectName = var.ProjectName
  ResGP_location = var.ResGP_location
  ResGP_name = var.ResGP_name
  VMServer_CreateOption = var.VMServer_CreateOption
  VMServer_admin_password = var.VMServer_admin_password
  VMServer_admin_username = var.VMServer_admin_username
  VMserver_name = var.VMserver_name
  vm_availabilty_set_id = module.avail_set.avail_set_id_out
  image_id = data.azurerm_image.image_name.id
  nic_card = [module.NIC.vm_nic_id,]
  os_disk_name = "${var.VMserver_name}${var.os_disk_name}"
  tag_app = var.tag_app
  tag_env = var.tag_env
  vm_size = var.vm_size
  tag_BusUnit = var.tag_BusUnit
  tag_CostCen = var.tag_CostCen
  tag_projNum = var.tag_projNum
  data_disk_Coption = var.data_disk_Coption
  data_disk_name = "${var.VMserver_name}${var.data_disk_name}"
  data_disk_size = var.data_disk_size
  domain_password = var.domain_password
  p_data_disk_Coption = var.p_data_disk_Coption
  p_data_disk_name = "${var.VMserver_name}${var.p_data_disk_name}"
  p_data_disk_size = var.p_data_disk_size
}
#Server2
module "VMserver2" {
  source = "./modules/compute/virtual_machine"
  OS_image_ResGP_name = var.OS_image_ResGP_name
  OS_image_name = var.OS_image_name
  ProjectName = var.ProjectName
  ResGP_location = var.ResGP_location
  ResGP_name = var.ResGP_name
  VMServer_CreateOption = var.VMServer2_CreateOption
  VMServer_admin_password = var.VMServer2_admin_password
  VMServer_admin_username = var.VMServer2_admin_username
  VMserver_name = var.VMserver2_name
  vm_availabilty_set_id = module.avail_set.avail_set_id_out
  image_id = data.azurerm_image.image_name.id
  nic_card = [module.NIC2.vm_nic_id,]
  os_disk_name = "${var.VMserver2_name}${var.os_disk_name}"
  tag_app = var.tag_app
  tag_env = var.tag_env
  vm_size = var.vm_size
  tag_BusUnit = var.tag_BusUnit
  tag_CostCen = var.tag_CostCen
  tag_projNum = var.tag_projNum
  data_disk_Coption = var.data2_disk_Coption
  data_disk_name = "${var.VMserver2_name}${var.data_disk_name}"
  data_disk_size = var.data2_disk_size
  domain_password = var.domain_password
  p_data_disk_Coption = var.p_data_disk_Coption
  p_data_disk_name = "${var.VMserver2_name}${var.p_data_disk_name}"
  p_data_disk_size = var.p_data_disk_size
}

#Add VM nic to NSG
#VM nic1
resource "azurerm_network_interface_security_group_association" "nsg_add" {
  network_interface_id = module.NIC.vm_nic_id
  network_security_group_id = module.NSG_ProjName.nsg_out_id
}
#VM nic2
resource "azurerm_network_interface_security_group_association" "nsg_add2" {
  network_interface_id = module.NIC2.vm_nic_id
  network_security_group_id = module.NSG_ProjName.nsg_out_id
}
#Load balancer
module "loadbalancer" {
  source = "./modules/network/load_balancer"
  lb_ResGP_name = var.lb_ResGP_name
  lb_allocation_method = var.lb_allocation_method
  lb_front_ip_config_name = var.lb_front_ip_config_name
  lb_location = var.lb_location
  lb_name = "${var.ProjectName}${var.lb_name}"
  lb_public_name = "${var.ProjectName}${var.lb_public_name}"
  tag_BusUnit = var.tag_BusUnit
  tag_CostCen = var.tag_CostCen
  tag_app = var.tag_app
  tag_env = var.tag_env
  tag_projNum = var.tag_projNum
}
#Storage Account
resource azurerm_storage_account "StorageAccount" {
  account_replication_type = var.SA_replicationType
  account_tier = var.SA_AccountTier
  access_tier = var.SA_AccessTier
  location = var.ResGP_location
  name = lower("${var.ProjectName}storageaccount")
  resource_group_name = var.ResGP_name
  account_kind = var.SA_AccountKind
  tags = {
    Environment     = var.tag_env
    Application     = var.tag_app
    Project_Number  = var.tag_projNum
    CostCenter      = var.tag_CostCen
    BusinessUnit    = var.tag_BusUnit
  }
}
#Storage Account File Share
resource azurerm_storage_share "ProdFS" {
  name = lower ("${var.ProjectName}prod")
  storage_account_name = azurerm_storage_account.StorageAccount.name
}