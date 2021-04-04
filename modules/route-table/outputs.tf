#--------------------------------------------------------------
# Route Table
#--------------------------------------------------------------

output "id" {
  value       = element(concat(aws_route_table.this.*.id, [""]), 0)
  description = "The ID of the routing table."
}

output "owner_id" {
  value       = element(concat(aws_route_table.this.*.owner_id, [""]), 0)
  description = "The ID of the AWS account that owns the route table."
}
