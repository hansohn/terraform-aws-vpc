#--------------------------------------------------------------
# Asset Naming Convention
#--------------------------------------------------------------

variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources"
}

#--------------------------------------------------------------
# Route
#--------------------------------------------------------------

variable "route_table_id" {
  type        = string
  default     = null
  description = "(Required) The ID of the routing table."
}

# One of the following destination arguments must be supplied:
variable "destination_cidr_block" {
  type        = string
  default     = null
  description = "(Optional) The destination CIDR block."
}

variable "destination_ipv6_cidr_block" {
  type        = string
  default     = null
  description = "(Optional) The destination IPv6 CIDR block."
}

# One of the following target arguments must be supplied:
variable "egress_only_gateway_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of a VPC Egress Only Internet Gateway."
}

variable "gateway_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of a VPC internet gateway or a virtual private gateway."
}

variable "instance_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of an EC2 instance."
}

variable "nat_gateway_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of a VPC NAT gateway."
}

variable "local_gateway_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of a Outpost local gateway."
}

variable "network_interface_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of an EC2 network interface."
}

variable "transit_gateway_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of an EC2 Transit Gateway."
}

variable "vpc_peering_connection_id" {
  type        = string
  default     = null
  description = "(Optional) Identifier of a VPC peering connection."
}

