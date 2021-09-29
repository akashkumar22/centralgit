resource "azurerm_public_ip" "lb_public_ip" {
  allocation_method = var.lb_allocation_method
  location = var.lb_location
  name = var.lb_public_name
  resource_group_name = var.lb_ResGP_name
  tags = {
    Environment     = var.tag_env
    Application     = var.tag_app
    Project_Number  = var.tag_projNum
    CostCenter      = var.tag_CostCen
    BusinessUnit    = var.tag_BusUnit
  }

}

resource "azurerm_lb" "loadbalancer" {
  location = var.lb_location
  name = var.lb_name
  resource_group_name = var.lb_ResGP_name

  frontend_ip_configuration {
    name = var.lb_front_ip_config_name
    public_ip_address_id = azurerm_public_ip.lb_public_ip.id
  }
  tags = {
    Environment     = var.tag_env
    Application     = var.tag_app
    Project_Number  = var.tag_projNum
    CostCenter      = var.tag_CostCen
    BusinessUnit    = var.tag_BusUnit
  }


}
