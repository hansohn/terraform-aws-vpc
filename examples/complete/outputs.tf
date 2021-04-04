#--------------------------------------------------------------
# VPC
#--------------------------------------------------------------

output "vpc_arn" {
  value       = module.vpc.vpc_arn
  description = "Amazon Resource Name (ARN) of VPC"
}

output "vpc_id" {
  value       = module.vpc.vpc_id
  description = "The ID of the VPC"
}

output "vpc_cidr_block" {
  value       = module.vpc.vpc_cidr_block
  description = "The CIDR block of the VPC"
}

output "vpc_instance_tenancy" {
  value       = module.vpc.vpc_instance_tenancy
  description = "Tenancy of instances spin up within VPC."
}

output "vpc_enable_dns_support" {
  value       = module.vpc.vpc_enable_dns_support
  description = "Whether or not the VPC has DNS support"
}

output "vpc_enable_dns_hostnames" {
  value       = module.vpc.vpc_enable_dns_hostnames
  description = "Whether or not the VPC has DNS hostname support"
}

output "vpc_enable_classiclink" {
  value       = module.vpc.vpc_enable_classiclink
  description = "Whether or not the VPC has Classiclink enabled"
}

output "vpc_main_route_table_id" {
  value       = module.vpc.vpc_main_route_table_id
  description = "The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an aws_main_route_table_association."
}

output "vpc_default_network_acl_id" {
  value       = module.vpc.vpc_default_network_acl_id
  description = "The ID of the network ACL created by default on VPC creation"
}

output "vpc_default_security_group_id" {
  value       = module.vpc.vpc_default_security_group_id
  description = "The ID of the security group created by default on VPC creation"
}

output "vpc_default_route_table_id" {
  value       = module.vpc.vpc_default_route_table_id
  description = "The ID of the route table created by default on VPC creation"
}

output "vpc_ipv6_association_id" {
  value       = module.vpc.vpc_ipv6_association_id
  description = "The association ID for the IPv6 CIDR block."
}

output "vpc_ipv6_cidr_block" {
  value       = module.vpc.vpc_ipv6_cidr_block
  description = "The IPv6 CIDR block."
}

output "vpc_owner_id" {
  value       = module.vpc.vpc_owner_id
  description = "The ID of the AWS account that owns the VPC."
}

#--------------------------------------------------------------
# Default Network ACL
#--------------------------------------------------------------

output "default_network_acl_id" {
  value = module.vpc.default_network_acl_id
  description = "The ID of the Default Network ACL"
}

output "default_network_acl_arn" {
  value = module.vpc.default_network_acl_arn
  description = "The ARN of the Default Network ACL"
}

output "default_network_acl_vpc_id" {
  value = module.vpc.default_network_acl_vpc_id
  description = "The ID of the associated VPC"
}

output "default_network_acl_subnet_ids" {
  value = module.vpc.default_network_acl_subnet_ids
  description = "IDs of associated Subnets"
}

output "default_network_acl_owner_id" {
  value = module.vpc.default_network_acl_owner_id
  description = "The ID of the AWS account that owns the Default Network ACL"
}

#--------------------------------------------------------------
# Default Security Group
#--------------------------------------------------------------

output "default_security_group_id" {
  value       = module.vpc.default_security_group_id
  description = "The ID of the security group"
}

output "default_security_group_arn" {
  value       = module.vpc.default_security_group_arn
  description = "The ARN of the security group"
}

output "default_security_group_vpc_id" {
  value       = module.vpc.default_security_group_vpc_id
  description = "The VPC ID."
}

output "default_security_group_owner_id" {
  value       = module.vpc.default_security_group_owner_id
  description = "The owner ID."
}

output "default_security_group_name" {
  value       = module.vpc.default_security_group_name
  description = "The name of the security group"
}

output "default_security_group_description" {
  value       = module.vpc.default_security_group_description
  description = "The description of the security group"
}

#--------------------------------------------------------------
# Internet Gateway
#--------------------------------------------------------------

output "igw_id" {
  value       = module.vpc.igw_id
  description = "The ID of the Internet Gateway."
}

output "igw_arn" {
  value       = module.vpc.igw_arn
  description = "The ARN of the Internet Gateway."
}

output "igw_owner_id" {
  value       = module.vpc.igw_owner_id
  description = "The ID of the AWS account that owns the internet gateway."
}

#--------------------------------------------------------------
# Availability Zones
#--------------------------------------------------------------

output "availability_zones" {
  value       = module.vpc.availability_zones
  description = "List of utilized availability zones"
}

#--------------------------------------------------------------
# Public Subnet
#--------------------------------------------------------------

output "public_subnet_ids" {
  value       = module.vpc.public_subnet_ids
  description = "The IDs of the Public subnets"
}

output "public_subnet_arns" {
  value       = module.vpc.public_subnet_arns
  description = "The ARNs of the Public subnets."
}

output "public_subnet_cidr_blocks" {
  value       = module.vpc.public_subnet_cidr_blocks
  description = "The CIDR blocks of the created Public subnets"
}

output "public_subnet_ipv6_cidr_block_association_ids" {
  value       = module.vpc.public_subnet_ipv6_cidr_block_association_ids
  description = "The association IDs for the IPv6 CIDR blocks of the Public subnets."
}

output "public_subnet_owner_ids" {
  value       = module.vpc.public_subnet_owner_ids
  description = "The ID of the AWS account that owns the Public subnets."
}

#--------------------------------------------------------------
# Public Route Table
#--------------------------------------------------------------

output "public_route_table_id" {
  value       = module.vpc.public_route_table_id
  description = "The ID of the Public routing table."
}

output "public_route_table_owner_id" {
  value       = module.vpc.public_route_table_owner_id
  description = "The ID of the AWS account that owns the Public route table."
}

#--------------------------------------------------------------
# Private Subnet
#--------------------------------------------------------------

output "private_subnet_ids" {
  value       = module.vpc.private_subnet_ids
  description = "The IDs of the Private subnets"
}

output "private_subnet_arns" {
  value       = module.vpc.private_subnet_arns
  description = "The ARNs of the Private subnets."
}

output "private_subnet_cidr_blocks" {
  value       = module.vpc.private_subnet_cidr_blocks
  description = "The CIDR blocks of the created Private subnets"
}

output "private_subnet_ipv6_cidr_block_association_ids" {
  value       = module.vpc.private_subnet_ipv6_cidr_block_association_ids
  description = "The association IDs for the IPv6 CIDR blocks of the Private subnets."
}

output "private_subnet_owner_ids" {
  value       = module.vpc.private_subnet_owner_ids
  description = "The ID of the AWS account that owns the Private subnets."
}

#--------------------------------------------------------------
# Private Route Table
#--------------------------------------------------------------

output "private_route_table_ids" {
  value       = module.vpc.private_route_table_ids
  description = "The ID of the Private routing table."
}

output "private_route_table_owner_ids" {
  value       = module.vpc.private_route_table_owner_ids
  description = "The ID of the AWS account that owns the Private route table."
}

#--------------------------------------------------------------
# Intra Subnet
#--------------------------------------------------------------

output "intra_subnet_ids" {
  value       = module.vpc.intra_subnet_ids
  description = "The IDs of the Intra subnets"
}

output "intra_subnet_arns" {
  value       = module.vpc.intra_subnet_arns
  description = "The ARNs of the Intra subnets."
}

output "intra_subnet_cidr_blocks" {
  value       = module.vpc.intra_subnet_cidr_blocks
  description = "The CIDR blocks of the created Intra subnets"
}

output "intra_subnet_ipv6_cidr_block_association_ids" {
  value       = module.vpc.intra_subnet_ipv6_cidr_block_association_ids
  description = "The association IDs for the IPv6 CIDR blocks of the Intra subnets."
}

output "intra_subnet_owner_ids" {
  value       = module.vpc.intra_subnet_owner_ids
  description = "The ID of the AWS account that owns the Intra subnets."
}

#--------------------------------------------------------------
# Intra Route Table
#--------------------------------------------------------------

output "intra_route_table_id" {
  value       = module.vpc.intra_route_table_id
  description = "The ID of the Intra routing table."
}

output "intra_route_table_owner_id" {
  value       = module.vpc.intra_route_table_owner_id
  description = "The ID of the AWS account that owns the Intra route table."
}
