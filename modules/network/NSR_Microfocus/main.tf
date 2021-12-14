#NSR Allow Microfocus
resource azurerm_network_security_rule "MF-IN-TCP-3001" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "MF-IN-TCP-3001"
  network_security_group_name     = var.NSG_name
  priority                        = 130
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "3001"
  source_address_prefix           = "10.213.31.228"
  destination_address_prefix      = "*"
}
resource azurerm_network_security_rule "MF-Out-TCP-3001" {
  access                          = "Allow"
  direction                       = "Outbound"
  name                            = "MF-Out-TCP-3001"
  network_security_group_name     = var.NSG_name
  priority                        = 131
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "3001"
  source_address_prefix           = "*"
  destination_address_prefix      = "10.213.31.228"
}
resource azurerm_network_security_rule "MF-IN-TCP-1002" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "MF-IN-TCP-1002"
  network_security_group_name     = var.NSG_name
  priority                        = 132
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "1002"
  source_address_prefix           = "10.213.31.228"
  destination_address_prefix      = "*"
}
resource azurerm_network_security_rule "MF-Out-TCP-1002" {
  access                          = "Allow"
  direction                       = "Outbound"
  name                            = "MF-Out-TCP-1002"
  network_security_group_name     = var.NSG_name
  priority                        = 133
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "1002"
  source_address_prefix           = "*"
  destination_address_prefix      = "10.213.31.228"
}
##NSR Allow SNOW_ICMP
resource azurerm_network_security_rule "MF_ICMP" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "MF_ICMP"
  network_security_group_name     = var.NSG_name
  priority                        = 134
  protocol                        = "ICMP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "*"
  source_address_prefix           = "10.213.31.228"
  destination_address_prefix      = "*"
}