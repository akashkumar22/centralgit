#Create Resource Group
resource azurerm_resource_group "ResGP" {
  location = var.ResGP_location
  name = var.ResGP_name
    tags = {
    Environment     = var.tag_env
    Application     = var.tag_app
    Project_Number  = var.tag_projNum
    CostCenter      = var.tag_CostCen
    BusinessUnit    = var.tag_BusUnit
  }

}
