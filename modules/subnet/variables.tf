#--------------------------------------------------------------
# Subnet
#--------------------------------------------------------------

variable "availability_zone" {
  type        = string
  default     = null
  description = "(Optional) The AZ for the subnet. Conflicts with 'availability_zone_id'"
}

variable "availability_zone_id" {
  type        = string
  default     = null
  description = "(Optional) The AZ ID of the subnet. Conflicts with 'availability_zone'"
}

variable "availability_zones" {
  type        = list(string)
  default     = []
  description = "(Optional) List of AZs for the subnet. Implements dynamic subnets. Conflicts with 'availability_zone_ids'."
}

variable "availability_zone_ids" {
  type        = list(string)
  default     = []
  description = "(Optional) List of AZ IDs of the subnet. Inplements dynamic subnets. Conflicts with 'availability_zones'."
}

variable "cidr_block" {
  type        = string
  default     = null
  description = "(Required) The CIDR block for the subnet."
}

variable "ipv6_cidr_block" {
  type        = string
  default     = null
  description = "(Optional) The IPv6 network range for the subnet, in CIDR notation. The subnet size must use a /64 prefix length."
}

variable "map_public_ip_on_launch" {
  type        = bool
  default     = null
  description = "(Optional) Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is false."
}

variable "outpost_arn" {
  type        = string
  default     = null
  description = "(Optional) The Amazon Resource Name (ARN) of the Outpost."
}

variable "assign_ipv6_address_on_creation" {
  type        = bool
  default     = null
  description = "(Optional) Specify true to indicate that network interfaces created in the specified subnet should be assigned an IPv6 address. Default is false"
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "(Required) The VPC ID."
}

variable "subnet_type" {
  type        = string
  default     = "private"
  description = "(Optional) Subnet type. Can be 'public' or 'private'. Defaults to 'private'."
}
