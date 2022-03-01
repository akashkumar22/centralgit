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
  description                     = "Blocks all inbound traffic"
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
  source_address_prefixes       = ["10.0.0.0/8", "172.16.0.0/12", "152.54.0.0/16", "152.64.0.0/16", "152.159.0.0/16", "168.116.0.0/16", "198.45.31.0/24"]
  destination_address_prefix    = "*"
  description                   = "Enables RDP traffic over 3389 TCP from the Datacenters and ZPAs"
}
resource azurerm_network_security_rule "ICMP_for_DCs" {
  access                          = "Allow"
  direction                       = "Inbound"
  name                            = "ICMP_for_DCs"
  network_security_group_name     = var.NSG_name
  priority                        = 101
  protocol                        = "ICMP"
  resource_group_name             = var.ResGP_name
  source_port_range               = "*"
  destination_port_range          = "*"
  source_address_prefixes         = ["10.0.0.0/8"]
  destination_address_prefix      = "*"
  description                     = "Enables ICMP (ping) traffic from the datacenters and ZPAs"
}