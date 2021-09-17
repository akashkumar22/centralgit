#Project information
ProjectName                           = "AutoAny"

#Tags information
tag_env                               = "Development"
tag_app                               = "Automation Anywhere"
tag_BusUnit                           = "TCS"
tag_CostCen                           = "None"
tag_projNum                           = "None"

#Resource group information
ResGP_name                            = "AutoAnyProd"
ResGP_location                        = "eastus2"

#NSG information
#Deny basic
basic_nsg_name =  "AutoAnyProdNSG"

#Remote Desktop
sec_rule_name                         = "RDP_TCP_3389"
sec_rule_priority                     = "100"
sec_rule_direction                    = "Inbound"
sec_rule_access                       = "Allow"
sec_rule_protocol                     = "*"
sec_rule_source_port_range            = "*"
sec_rule_destination_port_range       = "3389"
sec_rule_source_address_prefixes        = ["10.213.0.0/16","10.212.0.0/16"]
sec_rule_destination_address_prefix   ="*"

#Virtual Network Information
vnet_name                       = "MHE-PROD-VNET"
vnet_ResGP_name                 = "VNETs-RG"

#Subnet information
subnet_name                     = "AutoAnyProdSN"
subnet_ResGP_name               = "VNETs-RG"
subnet_vnet_name                = "MHE-PROD-VNET"

#Resource Group Information
avail_set_name                  = "-Avail-Set"

#OS Image information
OS_image_name                   = "MHESvr2K19Std"
OS_image_ResGP_name             = "MHETemplatesRG"

#VM Server information
#Server1
VMserver_name                   = "za2gtbw9002"
vm_size                         = "Standard_D8s_v4"
VMServer_CreateOption           = "FromImage"
os_disk_name                    = "-OSDisk"
VMServer_admin_username         = "MHEAdmin"
VMServer_admin_password         = "!QAZ1qaz@WSX2wsx"

#P Drive information
p_data_disk_name                = "-Pdrive"
p_data_disk_Coption             = "Empty"
p_data_disk_size                = "48"

#Data disk infomation
data_disk_name                  = "-Datadisk"
data_disk_Coption               = "Empty"
data_disk_size                  = "512"

#Server2
VMserver2_name                   = "za2gtbw9003"
vm2_size                         = "Standard_D8s_v4"
VMServer2_CreateOption           = "FromImage"
os2_disk_name                    = "OSDisk"
VMServer2_admin_username         = "MHEAdmin"
VMServer2_admin_password         = "!QAZ1qaz@WSX2wsx"

#P Drive information
p_data2_disk_name                = "-Pdrive"
p_data2_disk_Coption             = "Empty"
p_data2_disk_size                = "48"

#Data disk infomation
data2_disk_name                  = "-Datadisk"
data2_disk_Coption               = "Empty"
data2_disk_size                  = "512"

#Load Balancer information
lb_location                     = "eastus2"
lb_name                         = "LB"
lb_ResGP_name                   = "AutoAnyProd"
lb_allocation_method            = "Static"
lb_public_name                  = "PubNameLB"
lb_front_ip_config_name         = "FrontIP"