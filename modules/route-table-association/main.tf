#--------------------------------------------------------------
# Route Table Association
#--------------------------------------------------------------

resource "aws_route_table_association" "this" {
  count          = var.enabled ? 1 : 0
  subnet_id      = var.subnet_id
  gateway_id     = var.gateway_id
  route_table_id = var.route_table_id
}
