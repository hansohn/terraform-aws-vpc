#--------------------------------------------------------------
# VPC Endpoint
#--------------------------------------------------------------  

variable "service_name" {
  type        = string
  default     = null
  description = "(Required) The service name. For AWS services the service name is usually in the form com.amazonaws.<region>.<service> (the SageMaker Notebook service is an exception to this rule, the service name is in the form aws.sagemaker.<region>.notebook)."
}

variable "vpc_id" {
  type        = string
  default     = null
  description = "(Required) The ID of the VPC in which the endpoint will be used."
}

variable "auto_accept" {
  type        = bool
  default     = null
  description = "(Optional) Accept the VPC endpoint (the VPC endpoint and service need to be in the same AWS account)."
}

variable "policy" {
  type        = string
  default     = null
  description = "(Optional) A policy to attach to the endpoint that controls access to the service. Defaults to full access. All Gateway and some Interface endpoints support policies - see the relevant AWS documentation for more details."
}

variable "private_dns_enabled" {
  type        = bool
  default     = null
  description = "(Optional; AWS services and AWS Marketplace partner services only) Whether or not to associate a private hosted zone with the specified VPC. Applicable for endpoints of type Interface."
}

variable "route_table_ids" {
  type        = list(string)
  default     = null
  description = "(Optional) One or more route table IDs. Applicable for endpoints of type Gateway."
}

variable "subnet_ids" {
  type        = list(string)
  default     = null
  description = "(Optional) The ID of one or more subnets in which to create a network interface for the endpoint. Applicable for endpoints of type Interface."
}

variable "security_group_ids" {
  type        = list(string)
  default     = null
  description = "(Optional) The ID of one or more security groups to associate with the network interface. Required for endpoints of type Interface."
}

variable "vpc_endpoint_type" {
  type        = string
  default     = null
  description = "(Optional) The VPC endpoint type, Gateway or Interface. Defaults to Gateway."
}
