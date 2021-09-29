#Load Balancer variables
variable "lb_location" {}
variable "lb_name" {}
variable "lb_ResGP_name" {}
variable "lb_allocation_method" {}
variable "lb_public_name" {}
variable "lb_front_ip_config_name" {}

#Tag variables
variable "tag_env" {}
variable "tag_app" {}
variable "tag_projNum" {}
variable "tag_CostCen" {}
variable "tag_BusUnit" {}