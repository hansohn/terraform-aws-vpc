#--------------------------------------------------------------
# Network ACL
#--------------------------------------------------------------

output "id" {
  value       = element(concat(aws_network_acl.this.*.id, [""]), 0)
  description = "The ID of the network ACL"
}

output "arn" {
  value       = element(concat(aws_network_acl.this.*.arn, [""]), 0)
  description = "The ARN of the network ACL"
}

output "owner_id" {
  value       = element(concat(aws_network_acl.this.*.owner_id, [""]), 0)
  description = "The ID of the AWS account that owns the network ACL."
}
