resource azurerm_network_security_rule "ICMP_for_DCs" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "ICMP_for_DCs"
  network_security_group_name     = var.NSG_name
  priority                        = 135
  protocol                        = "ICMP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "*"
  source_address_prefixes         = ["10.212.0.0/16","10.213.0.0/16"]
  destination_address_prefix      = "*"
}