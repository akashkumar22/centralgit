data azurerm_resource_group "ResGP"{
  name = var.ResGP_name
}

resource "azurerm_network_security_group" "NSG" {
  location = data.azurerm_resource_group.ResGP.location
  name = var.basic_nsg_name
  resource_group_name = data.azurerm_resource_group.ResGP.name

  tags = {
    Environment     = var.tag_env
    Application     = var.tag_app
    Project_Number  = var.tag_projNum
    CostCenter      = var.tag_CostCen
    BusinessUnit    = var.tag_BusUnit
  }

}