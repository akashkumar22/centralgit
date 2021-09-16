data "azurerm_resource_group" "ResGP" {
  name = var.ResGP_name
}
data azurerm_subnet "subnet_lookup" {

  name = var.subnet_name
  resource_group_name = var.ResGP_name
  virtual_network_name = var.vnet_name
}