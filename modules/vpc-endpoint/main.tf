#--------------------------------------------------------------
# VPC Endpoint
#--------------------------------------------------------------

resource "aws_vpc_endpoint" "this" {
  count               = module.lable.enabled
  service_name        = var.service_name
  vpc_id              = var.vpc_id
  auto_accept         = var.auto_accept
  policy              = var.policy
  private_dns_enabled = var.private_dns_enabled
  route_table_ids     = var.route_table_ids
  subnet_ids          = var.subnet_ids
  security_group_ids  = var.security_group_ids
  tags                = module.this.tags
  vpc_endpoint_type   = var.vpc_endpoint_type
}
