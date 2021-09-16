provider "azurerm" {
  features {}
}

module "ResGP" {
  source = "./m"
}