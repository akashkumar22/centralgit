
#Block all inbound ports
resource azurerm_network_security_rule "NSR_In" {
  access                          = "Deny"
  direction                       = "Inbound"
  name                            = "BlockInboundTraffic"
  network_security_group_name     = var.NSG_name
  priority                        = 4096
  protocol                        = "*"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "*"
  source_address_prefix           = "*"
  destination_address_prefix      = "*"
}

#NSR Allow RDP from 10.112.0.0/16 network (ZScaler)
resource azurerm_network_security_rule "NSR_BasicInternalRDP" {
  access                        = "Allow"
  direction                     = "Inbound"
  name                          = "RDP_TCP_BasicInternalRDP"
  network_security_group_name   = var.NSG_name
  priority                      = 100
  protocol                      = "*"
  resource_group_name           = var.ResGP_name
  source_port_range             = "*"
  destination_port_range        = "3389"
  source_address_prefixes       = ["10.112.0.0/16","10.212.0.0/16","10.213.0.0/16"]
  destination_address_prefix    = "*"
}
#NSR Allow SNOW WMI TCP
resource azurerm_network_security_rule "SNOW_WMI_TCP" {
  access                        = "Allow"
  direction                     = "Inbound"
  name                          = "SNOW_WMI_TCP"
  network_security_group_name   = var.NSG_name
  priority                      = 101
  protocol                      = "TCP"
  resource_group_name           = var.ResGP_name
  source_port_range             = "*"
  destination_port_range        = "135"
  source_address_prefixes       = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix    = "*"
}
#NSR Allow SNOW WMI Secure TCP
resource azurerm_network_security_rule "SNOW_WMIS_TCP" {
  access                        = "Allow"
  direction                     = "Inbound"
  name                          = "SNOW_WMIS_TCP"
  network_security_group_name   = var.NSG_name
  priority                      = 102
  protocol                      = "TCP"
  resource_group_name           = var.ResGP_name
  source_port_range             = "*"
  destination_port_range        = "137"
  source_address_prefixes       = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix    = "*"
}
#NSR Allow HTTP
resource azurerm_network_security_rule "AllowHTTP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "AllowHTTP"
  network_security_group_name     = var.NSG_name
  priority                        = 103
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "80"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
#NSR Allow HTTPS
resource azurerm_network_security_rule "AllowHTTPS" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "AllowHTTPS"
  network_security_group_name     = var.NSG_name
  priority                        = 104
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "443"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
#NSR Allow SNOW WINRM
resource azurerm_network_security_rule "SNOW_WINRM" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_WINRM"
  network_security_group_name     = var.NSG_name
  priority                        = 105
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "5985"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
#NSR Allow SNOW WSMANS
resource azurerm_network_security_rule "SNOW_WSMANS" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_WSMANS"
  network_security_group_name     = var.NSG_name
  priority                        = 106
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "5986"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
#NSR Allow SNOW WBEM_HTTPS
resource azurerm_network_security_rule "SNOW_WBEM_HTTPS" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_WBEM_HTTPS"
  network_security_group_name     = var.NSG_name
  priority                        = 107
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "5989"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
#NSR Allow SNOW DNS TCP
resource azurerm_network_security_rule "SNOW_DNS_TCP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_DNS_TCP"
  network_security_group_name     = var.NSG_name
  priority                        = 108
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "53"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130","10.213.3.21","10.212.3.21"]
  destination_address_prefix      = "*"
}
#NSR Allow SNOW DNS UDP
resource azurerm_network_security_rule "SNOW_DNS_UDP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_DNS_UDP"
  network_security_group_name     = var.NSG_name
  priority                        = 109
  protocol                        = "UDP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "53"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130","10.213.3.21","10.212.3.21"]
  destination_address_prefix      = "*"
}
#NSR Allow SNOW SMB TCP
resource azurerm_network_security_rule "SNOW_SMB_TCP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_SMB_TCP"
  network_security_group_name     = var.NSG_name
  priority                        = 110
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "445"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
#NSR Allow SNOW SMB UDP
resource azurerm_network_security_rule "SNOW_SMB_UDP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_SMB_UDP"
  network_security_group_name     = var.NSG_name
  priority                        = 111
  protocol                        = "UDP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "445"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
#NSR Allow SNOW LDAP TCP
resource azurerm_network_security_rule "SNOW_LDAP_TCP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_LDAP_TCP"
  network_security_group_name     = var.NSG_name
  priority                        = 112
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "389"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
#NSR Allow SNOW LDAP UDP
resource azurerm_network_security_rule "SNOW_LDAP_UDP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_LDAP_UDP"
  network_security_group_name     = var.NSG_name
  priority                        = 113
  protocol                        = "UDP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "389"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
##NSR Allow SNOW_TCP_1024_1034
resource azurerm_network_security_rule "SNOW_TCP_1024_1034" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_TCP_1024_1034"
  network_security_group_name     = var.NSG_name
  priority                        = 114
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "1024-1034"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
##NSR Allow SNOW_SNMP_UDP
resource azurerm_network_security_rule "SNOW_SNMP_UDP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_SNMP_UDP"
  network_security_group_name     = var.NSG_name
  priority                        = 115
  protocol                        = "UDP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "162"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
##NSR Allow SNOW_ICMP
resource azurerm_network_security_rule "SNOW_ICMP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_ICMP"
  network_security_group_name     = var.NSG_name
  priority                        = 116
  protocol                        = "ICMP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "*"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
##NSR Allow SNOW NetBIOS Inbound
resource azurerm_network_security_rule "SNOW_NetBIOS" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_NetBIOS"
  network_security_group_name     = var.NSG_name
  priority                        = 117
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "139"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
##NSR Allow SNOW Dynamic TCP Inbound
resource azurerm_network_security_rule "SNOW_Dynamic_TCP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_Dynamic_TCP"
  network_security_group_name     = var.NSG_name
  priority                        = 118
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "49152-65535"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
##NSR Allow SNOW Dynamic UDP Inbound
resource azurerm_network_security_rule "SNOW_Dynamic_UDP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_Dynamic_UDP"
  network_security_group_name     = var.NSG_name
  priority                        = 119
  protocol                        = "UDP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "49152-65535"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}
##NSR Allow SNOW WMI Secure Oubound
resource azurerm_network_security_rule "SNOW_WMI_UDP_Out" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_WMI_UDP_Out"
  network_security_group_name     = var.NSG_name
  priority                        = 120
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "137"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
}