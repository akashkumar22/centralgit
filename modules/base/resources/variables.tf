
variable "ResGP_name" {
  description = "(Required) The Name which should be used for this Resource Group."
}
variable "ResGP_location" {
  description = "(Required) The Azure Region where the Resource Group should exist."
}
variable "tag_env" {}
variable "tag_app" {}
variable "tag_projNum" {}
variable "tag_CostCen" {}
variable "tag_BusUnit" {}