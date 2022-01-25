#NSR Allow SNOW WMI TCP
resource azurerm_network_security_rule "SNOW_WMI_TCP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_WMI_TCP"
  network_security_group_name     = var.NSG_name
  priority                        = 1001
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "135"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW WMI TCP"
}
#NSR Allow SNOW WMI Secure TCP
resource azurerm_network_security_rule "SNOW_WMIS_TCP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_WMIS_TCP"
  network_security_group_name     = var.NSG_name
  priority                        = 1002
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "137"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW WMI Secure TCP"
}
#NSR Allow HTTP
resource azurerm_network_security_rule "SNOW_AllowHTTP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_AllowHTTP"
  network_security_group_name     = var.NSG_name
  priority                        = 1003
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "80"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow HTTP"
}
#NSR Allow HTTPS
resource azurerm_network_security_rule "SNOW_AllowHTTPS" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_AllowHTTPS"
  network_security_group_name     = var.NSG_name
  priority                        = 1004
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "443"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow HTTPS"
}
#NSR Allow SNOW WINRM
resource azurerm_network_security_rule "SNOW_WINRM" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_WINRM"
  network_security_group_name     = var.NSG_name
  priority                        = 1005
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "5985"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW WINRM"
}
#NSR Allow SNOW WSMANS
resource azurerm_network_security_rule "SNOW_WSMANS" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_WSMANS"
  network_security_group_name     = var.NSG_name
  priority                        = 1006
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "5986"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW WSMANS"
}
#NSR Allow SNOW WBEM_HTTPS
resource azurerm_network_security_rule "SNOW_WBEM_HTTPS" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_WBEM_HTTPS"
  network_security_group_name     = var.NSG_name
  priority                        = 1007
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "5989"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW WBEM_HTTPS"
}
#NSR Allow SNOW DNS TCP
resource azurerm_network_security_rule "SNOW_DNS_TCP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_DNS_TCP"
  network_security_group_name     = var.NSG_name
  priority                        = 1008
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "53"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130","10.213.3.21","10.212.3.21"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW DNS TCP"
}
#NSR Allow SNOW DNS UDP
resource azurerm_network_security_rule "SNOW_DNS_UDP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_DNS_UDP"
  network_security_group_name     = var.NSG_name
  priority                        = 1009
  protocol                        = "UDP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "53"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130","10.213.3.21","10.212.3.21"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW DNS UDP"
}
#NSR Allow SNOW SMB TCP
resource azurerm_network_security_rule "SNOW_SMB_TCP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_SMB_TCP"
  network_security_group_name     = var.NSG_name
  priority                        = 1010
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "445"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW SMB TCP"
}
#NSR Allow SNOW SMB UDP
resource azurerm_network_security_rule "SNOW_SMB_UDP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_SMB_UDP"
  network_security_group_name     = var.NSG_name
  priority                        = 1011
  protocol                        = "UDP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "445"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW SMB UDP"
}
#NSR Allow SNOW LDAP TCP
resource azurerm_network_security_rule "SNOW_LDAP_TCP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_LDAP_TCP"
  network_security_group_name     = var.NSG_name
  priority                        = 1012
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "389"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW LDAP TCP"
}
#NSR Allow SNOW LDAP UDP
resource azurerm_network_security_rule "SNOW_LDAP_UDP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_LDAP_UDP"
  network_security_group_name     = var.NSG_name
  priority                        = 1013
  protocol                        = "UDP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "389"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW LDAP UDP"
}
##NSR Allow SNOW_TCP_1024_1034
resource azurerm_network_security_rule "SNOW_TCP_1024_1034" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_TCP_1024_1034"
  network_security_group_name     = var.NSG_name
  priority                        = 1014
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "1024-1034"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW_TCP_1024_1034"
}
##NSR Allow SNOW_SNMP_UDP
resource azurerm_network_security_rule "SNOW_SNMP_UDP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_SNMP_UDP"
  network_security_group_name     = var.NSG_name
  priority                        = 1015
  protocol                        = "UDP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "162"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW_SNMP_UDP"
}
##NSR Allow SNOW_ICMP
resource azurerm_network_security_rule "SNOW_ICMP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_ICMP"
  network_security_group_name     = var.NSG_name
  priority                        = 1016
  protocol                        = "ICMP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "*"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW_ICMP"
}
##NSR Allow SNOW NetBIOS Inbound
resource azurerm_network_security_rule "SNOW_NetBIOS" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_NetBIOS"
  network_security_group_name     = var.NSG_name
  priority                        = 1017
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "139"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW NetBIOS Inbound"
}
##NSR Allow SNOW Dynamic TCP Inbound
resource azurerm_network_security_rule "SNOW_Dynamic_TCP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_Dynamic_TCP"
  network_security_group_name     = var.NSG_name
  priority                        = 1018
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "49152-65535"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW Dynamic TCP Inbound"
}
##NSR Allow SNOW Dynamic UDP Inbound
resource azurerm_network_security_rule "SNOW_Dynamic_UDP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_Dynamic_UDP"
  network_security_group_name     = var.NSG_name
  priority                        = 1019
  protocol                        = "UDP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "49152-65535"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW Dynamic UDP Inbound"
}
##NSR Allow SNOW WMI Secure Oubound
resource azurerm_network_security_rule "SNOW_WMI_UDP_Out" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "SNOW_WMI_UDP_Out"
  network_security_group_name     = var.NSG_name
  priority                        = 1020
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "137"
  source_address_prefixes         = ["10.213.31.128","10.213.31.129","10.213.31.13","10.213.31.130"]
  destination_address_prefix      = "*"
  description                     = "Allow SNOW WMI Secure Outbound"
}