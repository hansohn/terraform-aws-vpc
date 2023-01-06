#--------------------------------------------------------------
# VPC Endpoint
#--------------------------------------------------------------

output "id" {
  value       = element(concat(aws_vpc_endpoint.this[*].id, [""]), 0)
  description = "The ID of the VPC endpoint."
}

output "arn" {
  value       = element(concat(aws_vpc_endpoint.this[*].arn, [""]), 0)
  description = "The Amazon Resource Name (ARN) of the VPC endpoint."
}

output "cidr_blocks" {
  value       = element(concat(aws_vpc_endpoint.this[*].cidr_blocks, [""]), 0)
  description = "The list of CIDR blocks for the exposed AWS service. Applicable for endpoints of type Gateway."
}

output "dns_entry" {
  value       = element(concat(aws_vpc_endpoint.this[*].dns_entry, [""]), 0)
  description = "The DNS entries for the VPC Endpoint. Applicable for endpoints of type Interface."
}

output "network_interface_ids" {
  value       = element(concat(aws_vpc_endpoint.this[*].network_interface_ids, [""]), 0)
  description = "One or more network interfaces for the VPC Endpoint. Applicable for endpoints of type Interface."
}

output "owner_id" {
  value       = element(concat(aws_vpc_endpoint.this[*].owner_id, [""]), 0)
  description = "The ID of the AWS account that owns the VPC endpoint."
}

output "prefix_list_id" {
  value       = element(concat(aws_vpc_endpoint.this[*].prefix_list_id, [""]), 0)
  description = "The prefix list ID of the exposed AWS service. Applicable for endpoints of type Gateway."
}

output "requester_managed" {
  value       = element(concat(aws_vpc_endpoint.this[*].requester_managed, [""]), 0)
  description = "Whether or not the VPC Endpoint is being managed by its service - true or false."
}

output "state" {
  value       = element(concat(aws_vpc_endpoint.this[*].state, [""]), 0)
  description = "The state of the VPC endpoint."
}
