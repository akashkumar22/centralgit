#NSR Allow Admin Center
resource azurerm_network_security_rule "AdminCenter_TCP5985" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "AdminCenter_TCP5985"
  network_security_group_name     = var.NSG_name
  priority                        = 122
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "5985"
  source_address_prefix           = "10.250.127.5"
  destination_address_prefix      = "*"
}
resource azurerm_network_security_rule "AdminCenter_TCP5986" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "AdminCenter_TCP5986"
  network_security_group_name     = var.NSG_name
  priority                        = 123
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "5986"
  source_address_prefix           = "10.250.127.5"
  destination_address_prefix      = "*"
}