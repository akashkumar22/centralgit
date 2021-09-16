resource "azurerm_network_interface" "nic_card" {
  location = var.ResGP_location
  name = var.nic_name
  resource_group_name = var.ResGP_name
  ip_configuration {
    name = var.ip_config_name
    private_ip_address_allocation = var.ip_config_priv_ip_alloc
    subnet_id = var.subnet_id
  }
  tags = {
    Environment     = var.tag_env
    Application     = var.tag_app
    Project_Number  = var.tag_projNum
    CostCenter      = var.tag_CostCen
    BusinessUnit    = var.tag_BusUnit
  }


}