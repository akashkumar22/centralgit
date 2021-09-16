data azurerm_resource_group "ResGP"{
  name = var.ResGP_name
}

resource "azurerm_network_security_group" "NSG" {
  location = data.azurerm_resource_group.ResGP.location
  name = var.nsg_name
  resource_group_name = data.azurerm_resource_group.ResGP.name

  security_rule {
    name = var.sec_rule_name
    access = var.sec_rule_access
    direction = var.sec_rule_direction
    priority = var.sec_rule_priority
    protocol = var.sec_rule_protocol
    source_port_range = var.sec_rule_source_port_range
    destination_port_range = var.sec_rule_destination_port_range
    source_address_prefixes = var.sec_rule_source_address_prefixes
    destination_address_prefix = var.sec_rule_destination_address_prefix
  }
  tags = {
    Environment     = var.tag_env
    Application     = var.tag_app
    Project_Number  = var.tag_projNum
    CostCenter      = var.tag_CostCen
    BusinessUnit    = var.tag_BusUnit
  }

}