#NSR Allow WSUS
resource azurerm_network_security_rule "WSUS_8530" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "WSUS_8530"
  network_security_group_name     = var.NSG_name
  priority                        = 121
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "8530"
  source_address_prefix           = "10.213.32.223"
  destination_address_prefix      = "*"
}