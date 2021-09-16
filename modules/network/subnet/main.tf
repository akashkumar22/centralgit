resource "azurerm_subnet" "subnet_mod" {
  name = var.subnet_name
  resource_group_name = var.ResGP_name
  virtual_network_name = var.vnet_name
  address_prefixes = [var.vnet_subnet_address_prefix,]
}