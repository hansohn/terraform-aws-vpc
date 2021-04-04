#--------------------------------------------------------------
# Default Security Group
#--------------------------------------------------------------

output "id" {
  value       = element(concat(aws_default_security_group.this.*.id, [""]), 0)
  description = "The ID of the security group"
}

output "arn" {
  value       = element(concat(aws_default_security_group.this.*.arn, [""]), 0)
  description = "The ARN of the security group"
}

output "vpc_id" {
  value       = element(concat(aws_default_security_group.this.*.vpc_id, [""]), 0)
  description = "The VPC ID."
}

output "owner_id" {
  value       = element(concat(aws_default_security_group.this.*.owner_id, [""]), 0)
  description = "The owner ID."
}

output "name" {
  value       = element(concat(aws_default_security_group.this.*.name, [""]), 0)
  description = "The name of the security group"
}

output "description" {
  value       = element(concat(aws_default_security_group.this.*.description, [""]), 0)
  description = "The description of the security group"
}

