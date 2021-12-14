resource azurerm_network_security_rule "KMSsvr" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "KMSsvr"
  network_security_group_name     = var.NSG_name
  priority                        = 124
  protocol                        = "TCP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "168"
  source_address_prefix           = "10.213.50.106"
  destination_address_prefix      = "*"
}
resource azurerm_network_security_rule "KMSSvr_1688" {
  access                      = "Allow"
  direction                   = "Inbound"
  name                        = "KMSsvr_In_1688"
  network_security_group_name = var.NSG_name
  priority                    = 1051
  protocol                    = "TCP"
  resource_group_name         = var.ResGP_name
  source_port_range           = "*"
  destination_port_range      = "1688"
  source_address_prefix       = "10.213.50.106"
  destination_address_prefix  = "*"
  description                 = "Allow KMS Server Inbound access for server keys"
}
resource azurerm_network_security_rule "KMSSvr_Out_1688" {
  access                      = "Allow"
  direction                   = "Outbound"
  name                        = "KMSsvr_Out_1688"
  network_security_group_name = var.NSG_name
  priority                    = 1052
  protocol                    = "TCP"
  resource_group_name         = var.ResGP_name
  source_port_range           = "*"
  destination_port_range      = "1688"
  source_address_prefix       = "*"
  destination_address_prefix  = "10.213.50.106"
  description                 = "Allow KMS Server Outbound access for server keys"
}