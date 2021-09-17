variable "ResGP_name" {}
variable "basic_nsg_name" {}
variable "sec_rule_name" {}
variable "sec_rule_priority" {}
variable "sec_rule_direction" {}
variable "sec_rule_access" {}
variable "sec_rule_protocol" {}
variable "sec_rule_source_port_range" {}
variable "sec_rule_destination_port_range" {}
variable "sec_rule_source_address_prefixes" {}
variable "sec_rule_destination_address_prefix" {}

#Tag variables
variable "tag_env" {}
variable "tag_app" {}
variable "tag_projNum" {}
variable "tag_CostCen" {}
variable "tag_BusUnit" {}