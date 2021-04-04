#--------------------------------------------------------------
# Network ACL
#-------------------------------------------------------------

resource "aws_network_acl" "this" {
  count = module.this.enabled ? 1 : 0
  vpc_id = var.vpc_id
  subnet_ids = var.subnet_ids
  dynamic "ingress" {
    for_each = var.ingress
    content {
      from_port = lookup(ingress.value, "from_port", null)
      to_port = lookup(ingress.value, "to_port", null)
      rule_no = lookup(ingress.value, "rule_no", null)
      action = lookup(ingress.value, "action", null)
      protocol = lookup(ingress.value, "protocol", null)
      cidr_block =lookup(ingress.value, "cidr_block", null) 
      ipv6_cidr_block = lookup(ingress.value, "ipv6_cidr_block", null)
      icmp_type = lookup(ingress.value, "icmp_type", null)
      icmp_code = lookup(ingress.value, "icmp_code", null)
    }
  }
  dynamic "egress" {
    for_each = var.egress
    content {
      from_port = lookup(egress.value, "from_port", null)
      to_port = lookup(egress.value, "to_port", null)
      rule_no = lookup(egress.value, "rule_no", null)
      action = lookup(egress.value, "action", null)
      protocol = lookup(egress.value, "protocol", null)
      cidr_block =lookup(egress.value, "cidr_block", null) 
      ipv6_cidr_block = lookup(egress.value, "ipv6_cidr_block", null)
      icmp_type = lookup(egress.value, "icmp_type", null)
      icmp_code = lookup(egress.value, "icmp_code", null)
    }
  }
  tags = module.this.tags
}
