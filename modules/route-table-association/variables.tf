#--------------------------------------------------------------
# Asset Naming Convention
#--------------------------------------------------------------

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}

#--------------------------------------------------------------
# Route Table Association
#--------------------------------------------------------------

variable "subnet_id" {
  type        = string
  default     = null
  description = "(Optional) The subnet ID to create an association. Conflicts with gateway_id."
}

variable "gateway_id" {
  type        = string
  default     = null
  description = "(Optional) The gateway ID to create an association. Conflicts with subnet_id."
}

variable "route_table_id" {
  type        = string
  default     = null
  description = "(Required) The ID of the routing table to associate with."
}
