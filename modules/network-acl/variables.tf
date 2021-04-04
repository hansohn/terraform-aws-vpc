#--------------------------------------------------------------
# Network ACL
#--------------------------------------------------------------

variable "vpc_id" {
  type        = string
  default     = null
  description = "(Required) The ID of the associated VPC."
}

variable "subnet_ids" {
  type        = list(string)
  default     = null
  description = "(Optional) A list of Subnet IDs to apply the ACL to"
}

variable "ingress" {
  type        = list(any)
  default     = []
  description = "(Optional) Specifies an ingress rule."
}

variable "egress" {
  type        = list(any)
  default     = []
  description = "(Optional) Specifies an egress rule."
}
