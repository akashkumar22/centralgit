output "vnet_id" {
  value = data.azurerm_virtual_network.vnet_lookup.id
}
output "vnet_name" {
  value = data.azurerm_virtual_network.vnet_lookup.name
}
output "ResGP_name" {
  value = data.azurerm_virtual_network.vnet_lookup.resource_group_name
}