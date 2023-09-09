#--------------------------------------------------------------
# VPC
#--------------------------------------------------------------

output "vpc_arn" {
  value       = element(concat(aws_vpc.this[*].arn, [""]), 0)
  description = "Amazon Resource Name (ARN) of VPC"
}

output "vpc_id" {
  value       = element(concat(aws_vpc.this[*].id, [""]), 0)
  description = "The ID of the VPC"
}

output "vpc_cidr_block" {
  value       = element(concat(aws_vpc.this[*].cidr_block, [""]), 0)
  description = "The CIDR block of the VPC"
}

output "vpc_instance_tenancy" {
  value       = element(concat(aws_vpc.this[*].instance_tenancy, [""]), 0)
  description = "Tenancy of instances spin up within VPC."
}

output "vpc_enable_dns_support" {
  value       = element(concat(aws_vpc.this[*].enable_dns_support, [""]), 0)
  description = "Whether or not the VPC has DNS support"
}

output "vpc_enable_dns_hostnames" {
  value       = element(concat(aws_vpc.this[*].enable_dns_hostnames, [""]), 0)
  description = "Whether or not the VPC has DNS hostname support"
}

output "vpc_main_route_table_id" {
  value       = element(concat(aws_vpc.this[*].main_route_table_id, [""]), 0)
  description = "The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an aws_main_route_table_association."
}

output "vpc_default_network_acl_id" {
  value       = element(concat(aws_vpc.this[*].default_network_acl_id, [""]), 0)
  description = "The ID of the network ACL created by default on VPC creation"
}

output "vpc_default_security_group_id" {
  value       = element(concat(aws_vpc.this[*].default_security_group_id, [""]), 0)
  description = "The ID of the security group created by default on VPC creation"
}

output "vpc_default_route_table_id" {
  value       = element(concat(aws_vpc.this[*].default_route_table_id, [""]), 0)
  description = "The ID of the route table created by default on VPC creation"
}

output "vpc_ipv6_association_id" {
  value       = element(concat(aws_vpc.this[*].ipv6_association_id, [""]), 0)
  description = "The association ID for the IPv6 CIDR block."
}

output "vpc_ipv6_cidr_block" {
  value       = element(concat(aws_vpc.this[*].ipv6_cidr_block, [""]), 0)
  description = "The IPv6 CIDR block."
}

output "vpc_owner_id" {
  value       = element(concat(aws_vpc.this[*].owner_id, [""]), 0)
  description = "The ID of the AWS account that owns the VPC."
}

#--------------------------------------------------------------
# Default Network ACL
#--------------------------------------------------------------

output "default_network_acl_id" {
  value       = element(concat(aws_default_network_acl.this[*].id, [""]), 0)
  description = "The ID of the Default Network ACL"
}

output "default_network_acl_arn" {
  value       = element(concat(aws_default_network_acl.this[*].arn, [""]), 0)
  description = "The ARN of the Default Network ACL"
}

output "default_network_acl_vpc_id" {
  value       = element(concat(aws_default_network_acl.this[*].vpc_id, [""]), 0)
  description = "The ID of the associated VPC"
}

output "default_network_acl_subnet_ids" {
  value       = element(concat(aws_default_network_acl.this[*].subnet_ids, [""]), 0)
  description = "IDs of associated Subnets"
}

output "default_network_acl_owner_id" {
  value       = element(concat(aws_default_network_acl.this[*].owner_id, [""]), 0)
  description = "The ID of the AWS account that owns the Default Network ACL"
}

#--------------------------------------------------------------
# Default Security Group
#--------------------------------------------------------------

output "default_security_group_id" {
  value       = element(concat(aws_default_security_group.this[*].id, [""]), 0)
  description = "The ID of the security group"
}

output "default_security_group_arn" {
  value       = element(concat(aws_default_security_group.this[*].arn, [""]), 0)
  description = "The ARN of the security group"
}

output "default_security_group_vpc_id" {
  value       = element(concat(aws_default_security_group.this[*].vpc_id, [""]), 0)
  description = "The VPC ID."
}

output "default_security_group_owner_id" {
  value       = element(concat(aws_default_security_group.this[*].owner_id, [""]), 0)
  description = "The owner ID."
}

output "default_security_group_name" {
  value       = element(concat(aws_default_security_group.this[*].name, [""]), 0)
  description = "The name of the security group"
}

output "default_security_group_description" {
  value       = element(concat(aws_default_security_group.this[*].description, [""]), 0)
  description = "The description of the security group"
}

#--------------------------------------------------------------
# Internet Gateway
#--------------------------------------------------------------

output "igw_id" {
  value       = element(concat(aws_internet_gateway.this[*].id, [""]), 0)
  description = "The ID of the Internet Gateway."
}

output "igw_arn" {
  value       = element(concat(aws_internet_gateway.this[*].arn, [""]), 0)
  description = "The ARN of the Internet Gateway."
}

output "igw_owner_id" {
  value       = element(concat(aws_internet_gateway.this[*].owner_id, [""]), 0)
  description = "The ID of the AWS account that owns the internet gateway."
}

#--------------------------------------------------------------
# Availability Zones
#--------------------------------------------------------------

output "availability_zones" {
  value       = local.availability_zones
  description = "List of utilized availability zones"
}

#--------------------------------------------------------------
# Public Subnet
#--------------------------------------------------------------

output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
  description = "The IDs of the Public subnets"
}

output "public_subnet_arns" {
  value       = aws_subnet.public[*].arn
  description = "The ARNs of the Public subnets."
}

output "public_subnet_cidr_blocks" {
  value       = aws_subnet.public[*].cidr_block
  description = "The CIDR blocks of the created Public subnets"
}

output "public_subnet_ipv6_cidr_block_association_ids" {
  value       = aws_subnet.public[*].ipv6_cidr_block_association_id
  description = "The association IDs for the IPv6 CIDR blocks of the Public subnets."
}

output "public_subnet_owner_ids" {
  value       = aws_subnet.public[*].owner_id
  description = "The ID of the AWS account that owns the Public subnets."
}

#--------------------------------------------------------------
# Public Route Table
#--------------------------------------------------------------

output "public_route_table_id" {
  value       = element(concat(aws_route_table.public[*].id, [""]), 0)
  description = "The ID of the Public routing table."
}

output "public_route_table_owner_id" {
  value       = element(concat(aws_route_table.public[*].owner_id, [""]), 0)
  description = "The ID of the AWS account that owns the Public route table."
}

#--------------------------------------------------------------
# Protected Subnet
#--------------------------------------------------------------

output "protected_subnet_ids" {
  value       = aws_subnet.protected[*].id
  description = "The IDs of the Protected subnets"
}

output "protected_subnet_arns" {
  value       = aws_subnet.protected[*].arn
  description = "The ARNs of the Protected subnets."
}

output "protected_subnet_cidr_blocks" {
  value       = aws_subnet.protected[*].cidr_block
  description = "The CIDR blocks of the created Protected subnets"
}

output "protected_subnet_ipv6_cidr_block_association_ids" {
  value       = aws_subnet.protected[*].ipv6_cidr_block_association_id
  description = "The association IDs for the IPv6 CIDR blocks of the Protected subnets."
}

output "protected_subnet_owner_ids" {
  value       = aws_subnet.protected[*].owner_id
  description = "The ID of the AWS account that owns the Protected subnets."
}

#--------------------------------------------------------------
# Protected Route Table
#--------------------------------------------------------------

output "protected_route_table_ids" {
  value       = aws_route_table.protected[*].id
  description = "The ID of the Protected routing table."
}

output "protected_route_table_owner_ids" {
  value       = aws_route_table.protected[*].owner_id
  description = "The ID of the AWS account that owns the Protected route table."
}

#--------------------------------------------------------------
# Private Subnet
#--------------------------------------------------------------

output "private_subnet_ids" {
  value       = aws_subnet.private[*].id
  description = "The IDs of the Private subnets"
}

output "private_subnet_arns" {
  value       = aws_subnet.private[*].arn
  description = "The ARNs of the Private subnets."
}

output "private_subnet_cidr_blocks" {
  value       = aws_subnet.private[*].cidr_block
  description = "The CIDR blocks of the created Private subnets"
}

output "private_subnet_ipv6_cidr_block_association_ids" {
  value       = aws_subnet.private[*].ipv6_cidr_block_association_id
  description = "The association IDs for the IPv6 CIDR blocks of the Private subnets."
}

output "private_subnet_owner_ids" {
  value       = aws_subnet.private[*].owner_id
  description = "The ID of the AWS account that owns the Private subnets."
}

#--------------------------------------------------------------
# Private Route Table
#--------------------------------------------------------------

output "private_route_table_id" {
  value       = element(concat(aws_route_table.private[*].id, [""]), 0)
  description = "The ID of the Private routing table."
}

output "private_route_table_owner_id" {
  value       = element(concat(aws_route_table.private[*].owner_id, [""]), 0)
  description = "The ID of the AWS account that owns the Private route table."
}
