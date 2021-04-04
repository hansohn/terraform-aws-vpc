#--------------------------------------------------------------
# Route Table Association
#--------------------------------------------------------------

output "id" {
  value       = element(concat(aws_route_table_association.this.*.id, [""]), 0)
  description = "The ID of the association"
}
