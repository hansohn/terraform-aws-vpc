#--------------------------------------------------------------
# Internet Gateway
#--------------------------------------------------------------

output "id" {
  value       = element(concat(aws_internet_gateway.this.*.id, [""]), 0)
  description = "The ID of the Internet Gateway."
}

output "arn" {
  value       = element(concat(aws_internet_gateway.this.*.arn, [""]), 0)
  description = "The ARN of the Internet Gateway."
}

output "owner_id" {
  value       = element(concat(aws_internet_gateway.this.*.owner_id, [""]), 0)
  description = "The ID of the AWS account that owns the internet gateway."
}
