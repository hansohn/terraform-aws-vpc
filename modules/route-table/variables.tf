#--------------------------------------------------------------
# Route Table
#--------------------------------------------------------------

variable "vpc_id" {
  type        = string
  description = "(Required) The VPC ID."
}

variable "route" {
  type        = list(any)
  default     = []
  description = "(Optional) A list of route objects"
}

variable "propagating_vgws" {
  type        = list(string)
  default     = null
  description = "(Optional) A list of virtual gateways for propagation."
}
