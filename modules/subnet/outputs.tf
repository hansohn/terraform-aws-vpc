#--------------------------------------------------------------
# Subnet
#--------------------------------------------------------------

output "ids" {
  value       = aws_subnet.this.*.id
  description = "The IDs of the subnets"
}

output "arns" {
  value       = aws_subnet.this.*.arn
  description = "The ARNs of the subnets."
}

output "cidr_blocks" {
  value       = aws_subnet.this.*.cidr_block
  description = "The CIDR blocks of the created subnets"
}

output "ipv6_cidr_block_association_ids" {
  value       = aws_subnet.this.*.ipv6_cidr_block_association_id
  description = "The association IDs for the IPv6 CIDR blocks."
}

output "owner_ids" {
  value       = aws_subnet.this.*.owner_id
  description = "The ID of the AWS account that owns the subnets."
}
