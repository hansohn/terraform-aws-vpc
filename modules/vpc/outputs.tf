#--------------------------------------------------------------
# VPC
#--------------------------------------------------------------

output "arn" {
  value       = element(concat(aws_vpc.this.*.arn, [""]), 0)
  description = "Amazon Resource Name (ARN) of VPC"
}

output "id" {
  value       = element(concat(aws_vpc.this.*.id, [""]), 0)
  description = "The ID of the VPC"
}

output "cidr_block" {
  value       = element(concat(aws_vpc.this.*.cidr_block, [""]), 0)
  description = "The CIDR block of the VPC"
}

output "instance_tenancy" {
  value       = element(concat(aws_vpc.this.*.instance_tenancy, [""]), 0)
  description = "Tenancy of instances spin up within VPC."
}

output "enable_dns_support" {
  value       = element(concat(aws_vpc.this.*.enable_dns_support, [""]), 0)
  description = "Whether or not the VPC has DNS support"
}

output "enable_dns_hostnames" {
  value       = element(concat(aws_vpc.this.*.enable_dns_hostnames, [""]), 0)
  description = "Whether or not the VPC has DNS hostname support"
}

output "enable_classiclink" {
  value       = element(concat(aws_vpc.this.*.enable_classiclink, [""]), 0)
  description = "Whether or not the VPC has Classiclink enabled"
}

output "main_route_table_id" {
  value       = element(concat(aws_vpc.this.*.main_route_table_id, [""]), 0)
  description = "The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an aws_main_route_table_association."
}

output "default_network_acl_id" {
  value       = element(concat(aws_vpc.this.*.default_network_acl_id, [""]), 0)
  description = "The ID of the network ACL created by default on VPC creation"
}

output "default_security_group_id" {
  value       = element(concat(aws_vpc.this.*.default_security_group_id, [""]), 0)
  description = "The ID of the security group created by default on VPC creation"
}

output "default_route_table_id" {
  value       = element(concat(aws_vpc.this.*.default_route_table_id, [""]), 0)
  description = "The ID of the route table created by default on VPC creation"
}

output "ipv6_association_id" {
  value       = element(concat(aws_vpc.this.*.ipv6_association_id, [""]), 0)
  description = "The association ID for the IPv6 CIDR block."
}

output "ipv6_cidr_block" {
  value       = element(concat(aws_vpc.this.*.ipv6_cidr_block, [""]), 0)
  description = "The IPv6 CIDR block."
}

output "owner_id" {
  value       = element(concat(aws_vpc.this.*.owner_id, [""]), 0)
  description = "The ID of the AWS account that owns the VPC."
}

