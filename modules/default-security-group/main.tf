#--------------------------------------------------------------
# Default Security Group
#--------------------------------------------------------------

resource "aws_default_security_group" "this" {
  count = module.this.enabled ? 1 : 0
  dynamic "ingress" {
    for_each = var.ingress
    content {
      cidr_blocks = lookup(ingress.value, "cidr_blocks", null)
      description = lookup(ingress.value, "description", null)
      from_port = lookup(ingress.value, "from_port", null)
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", null)
      prefix_list_ids = lookup(ingress.value, "prefix_list_ids", null)
      protocol = lookup(ingress.value, "protocol", null)
      security_groups = lookup(ingress.value, "security_groups", null)
      self = lookup(ingress.value, "self", null)
      to_port = lookup(ingress.value, "to_port", null)
    }
  }
  dynamic "egress" {
    for_each = var.egress
    content {
      cidr_blocks = lookup(egress.value, "cidr_blocks", null)
      description = lookup(egress.value, "description", null)
      from_port = lookup(egress.value, "from_port", null)
      ipv6_cidr_blocks = lookup(egress.value, "ipv6_cidr_blocks", null)
      prefix_list_ids = lookup(egress.value, "prefix_list_ids", null)
      protocol = lookup(egress.value, "protocol", null)
      security_groups = lookup(egress.value, "security_groups", null)
      self = lookup(egress.value, "self", null)
      to_port = lookup(egress.value, "to_port", null)
    }
  }
  vpc_id = var.vpc_id
  tags = module.this.tags
}
