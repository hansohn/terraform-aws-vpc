#--------------------------------------------------------------
# Route
#--------------------------------------------------------------

output "id" {
  value       = element(concat(aws_route.this[*].id, [""]), 0)
  description = "Route Table identifier and destination"
}
