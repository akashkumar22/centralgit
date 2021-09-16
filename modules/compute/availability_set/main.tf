#Create Availability Set
resource azurerm_availability_set "avail_set" {
  location = var.ResGP_location
  name = "${var.ProjectName}${var.avail_set_name}"
  resource_group_name = var.ResGP_name

  tags = {
    Environment     = var.tag_env
    Application     = var.tag_app
    Project_Number  = var.tag_projNum
    CostCenter      = var.tag_CostCen
    BusinessUnit    = var.tag_BusUnit
  }
}