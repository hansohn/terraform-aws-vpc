#--------------------------------------------------------------
# Default Security Group
#--------------------------------------------------------------

variable "ingress" {
  type        = list(any)
  default     = []
  description = "(Optional) Can be specified multiple times for each ingress rule."
}

variable "egress" {
  type        = list(any)
  default     = []
  description = "(Optional, VPC only) Can be specified multiple times for each egress rule."
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "(Optional, Forces new resource) The VPC ID. Note that changing the vpc_id will not restore any default security group rules that were modified, added, or removed. It will be left in its current state"
}
