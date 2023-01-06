#--------------------------------------------------------------
# Labeling
#--------------------------------------------------------------

module "vpc_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.this.enabled
  attributes = compact(concat(module.this.attributes, ["vpc"]))
  context    = module.this.context
}

module "default_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.this.enabled
  attributes = compact(concat(module.this.attributes, ["default"]))
  context    = module.this.context
}

module "public_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.this.enabled && var.enable_public_network
  attributes = compact(concat(module.this.attributes, ["public"]))
  context    = module.this.context
}

module "public_subnet_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.public_label.enabled
  attributes = compact(concat(module.this.attributes, ["subnet", "public"]))
  context    = module.this.context
}

module "protected_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.this.enabled && var.enable_protected_network
  attributes = compact(concat(module.this.attributes, ["protected"]))
  context    = module.this.context
}

module "protected_subnet_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.protected_label.enabled
  attributes = compact(concat(module.this.attributes, ["subnet", "protected"]))
  context    = module.this.context
}

module "private_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.this.enabled && var.enable_private_network
  attributes = compact(concat(module.this.attributes, ["private"]))
  context    = module.this.context
}

module "private_subnet_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.private_label.enabled
  attributes = compact(concat(module.this.attributes, ["subnet", "private"]))
  context    = module.this.context
}

module "igw_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.public_subnet_label.enabled && var.enable_internet_gateway
  attributes = compact(concat(module.this.attributes, ["igw"]))
  context    = module.this.context
}

module "nat_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.protected_subnet_label.enabled && module.public_subnet_label.enabled
  attributes = compact(concat(module.this.attributes, ["nat"]))
  context    = module.this.context
}

module "s3_vpc_endpoint_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.this.enabled
  attributes = compact(concat(module.this.attributes, ["vpce", "s3"]))
  context    = module.this.context
}

module "dynamodb_vpc_endpoint_label" {
  source     = "cloudposse/label/null"
  version    = "0.25.0"
  enabled    = module.this.enabled
  attributes = compact(concat(module.this.attributes, ["vpce", "dynamodb"]))
  context    = module.this.context
}

#--------------------------------------------------------------
# VPC
#--------------------------------------------------------------

resource "aws_vpc" "this" {
  count                            = module.vpc_label.enabled ? 1 : 0
  cidr_block                       = var.cidr_block
  instance_tenancy                 = var.instance_tenancy
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames
  enable_classiclink               = var.enable_classiclink
  enable_classiclink_dns_support   = var.enable_classiclink_dns_support
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block
  tags                             = module.vpc_label.tags

  lifecycle {
    create_before_destroy = true
  }
}

#--------------------------------------------------------------
# Default Network ACL
#--------------------------------------------------------------

resource "aws_default_network_acl" "this" {
  count                  = module.default_label.enabled && var.manage_default_network_acl ? 1 : 0
  default_network_acl_id = aws_vpc.this[0].default_network_acl_id
  subnet_ids = setsubtract(
    compact(flatten([
      aws_subnet.public[*].id,
      aws_subnet.protected[*].id,
      aws_subnet.private[*].id
    ])),
    compact(flatten([
      aws_network_acl.public[*].subnet_ids,
      aws_network_acl.protected[*].subnet_ids,
      aws_network_acl.private[*].subnet_ids
    ]))
  )
  dynamic "ingress" {
    for_each = var.default_network_acl_ingress
    content {
      from_port       = ingress.value.from_port
      to_port         = ingress.value.to_port
      rule_no         = ingress.value.rule_no
      action          = ingress.value.action
      protocol        = ingress.value.protocol
      cidr_block      = lookup(ingress.value, "cidr_block", null)
      ipv6_cidr_block = lookup(ingress.value, "ipv6_cidr_block", null)
      icmp_type       = lookup(ingress.value, "icmp_type", null)
      icmp_code       = lookup(ingress.value, "icmp_type", null)
    }
  }
  dynamic "egress" {
    for_each = var.default_network_acl_egress
    content {
      from_port       = egress.value.from_port
      to_port         = egress.value.to_port
      rule_no         = egress.value.rule_no
      action          = egress.value.action
      protocol        = egress.value.protocol
      cidr_block      = lookup(egress.value, "cidr_block", null)
      ipv6_cidr_block = lookup(egress.value, "ipv6_cidr_block", null)
      icmp_type       = lookup(egress.value, "icmp_type", null)
      icmp_code       = lookup(egress.value, "icmp_type", null)
    }
  }
  tags = module.default_label.tags

  lifecycle {
    ignore_changes = [
      subnet_ids
    ]
  }
}

#--------------------------------------------------------------
# Default Security Group
#--------------------------------------------------------------

resource "aws_default_security_group" "this" {
  count = module.default_label.enabled && var.manage_default_security_group ? 1 : 0
  dynamic "ingress" {
    for_each = var.default_security_group_ingress
    content {
      cidr_blocks      = lookup(ingress.value, "cidr_blocks", null)
      description      = lookup(ingress.value, "description", null)
      from_port        = ingress.value.from_port
      ipv6_cidr_blocks = lookup(ingress.value, "ipv6_cidr_blocks", null)
      prefix_list_ids  = lookup(ingress.value, "prefix_list_ids", null)
      protocol         = ingress.value.protocol
      security_groups  = lookup(ingress.value, "security_groups", null)
      self             = lookup(ingress.value, "self", null)
      to_port          = ingress.value.to_port
    }
  }
  dynamic "egress" {
    for_each = var.default_security_group_egress
    content {
      cidr_blocks      = lookup(egress.value, "cidr_blocks", null)
      description      = lookup(egress.value, "description", null)
      from_port        = egress.value.from_port
      ipv6_cidr_blocks = lookup(egress.value, "ipv6_cidr_blocks", null)
      prefix_list_ids  = lookup(egress.value, "prefix_list_ids", null)
      protocol         = egress.value.protocol
      security_groups  = lookup(egress.value, "security_groups", null)
      self             = lookup(egress.value, "self", null)
      to_port          = egress.value.to_port
    }
  }
  vpc_id = aws_vpc.this[0].id
  tags   = module.default_label.tags
}

#--------------------------------------------------------------
# Internet Gateway
#--------------------------------------------------------------

resource "aws_internet_gateway" "this" {
  count  = module.igw_label.enabled ? 1 : 0
  vpc_id = aws_vpc.this[0].id
  tags   = module.igw_label.tags

  lifecycle {
    create_before_destroy = true
  }
}

#--------------------------------------------------------------
# Subnetting
#--------------------------------------------------------------

data "aws_availability_zones" "available" {
  exclude_names    = var.exclude_availability_zone_names
  exclude_zone_ids = var.exclude_availability_zone_ids
  state            = "available"
}

locals {
  # dynamic subnets
  dyn_max_azs = min(compact([length(data.aws_availability_zones.available.names), var.max_availability_zones])...)
  dyn_azs = coalescelist(
    var.availability_zones,
    slice(data.aws_availability_zones.available.names, 0, local.dyn_max_azs)
  )
  dyn_azs_count         = length(local.dyn_azs)
  dyn_subnet_types      = length([for i in [module.public_subnet_label.enabled, module.protected_subnet_label.enabled, module.private_subnet_label.enabled] : i if i == true])
  dyn_subnet_newbits    = ceil(log(local.dyn_subnet_types * local.dyn_azs_count, 2))
  dyn_public_subnets    = module.public_subnet_label.enabled && var.enable_dynamic_subnets ? zipmap([for i in range(0, local.dyn_azs_count) : cidrsubnet(var.cidr_block, local.dyn_subnet_newbits, i)], local.dyn_azs) : {}
  dyn_protected_subnets = module.protected_subnet_label.enabled && var.enable_dynamic_subnets ? zipmap([for i in range(0, local.dyn_azs_count) : cidrsubnet(var.cidr_block, local.dyn_subnet_newbits, length(local.dyn_public_subnets) + i)], local.dyn_azs) : {}
  dyn_private_subnets   = module.private_subnet_label.enabled && var.enable_dynamic_subnets ? zipmap([for i in range(0, local.dyn_azs_count) : cidrsubnet(var.cidr_block, local.dyn_subnet_newbits, length(local.dyn_public_subnets) + length(local.dyn_protected_subnets) + i)], local.dyn_azs) : {}

  # static subnets
  static_azs               = distinct(flatten([values(var.public_subnet_cidrs), values(var.protected_subnet_cidrs), values(var.private_subnet_cidrs)]))
  static_public_subnets    = module.public_subnet_label.enabled && !var.enable_dynamic_subnets ? merge([for k, v in var.public_subnet_cidrs : { for i in v : i => k }]...) : {}
  static_protected_subnets = module.protected_subnet_label.enabled && !var.enable_dynamic_subnets ? merge([for k, v in var.protected_subnet_cidrs : { for i in v : i => k }]...) : {}
  static_private_subnets   = module.private_subnet_label.enabled && !var.enable_dynamic_subnets ? merge([for k, v in var.private_subnet_cidrs : { for i in v : i => k }]...) : {}

  # computed subnets
  availability_zones       = var.enable_dynamic_subnets ? local.dyn_azs : local.static_azs
  availability_zones_count = length(local.availability_zones)
  public_subnets           = module.public_subnet_label.enabled ? var.enable_dynamic_subnets ? local.dyn_public_subnets : local.static_public_subnets : {}
  protected_subnets        = module.protected_subnet_label.enabled ? var.enable_dynamic_subnets ? local.dyn_protected_subnets : local.static_protected_subnets : {}
  private_subnets          = module.private_subnet_label.enabled ? var.enable_dynamic_subnets ? local.dyn_private_subnets : local.static_private_subnets : {}
  public_subnets_count     = length(local.public_subnets)
  protected_subnets_count  = length(local.protected_subnets)
  private_subnets_count    = length(local.private_subnets)
}

#--------------------------------------------------------------
# Public Subnets
#--------------------------------------------------------------

resource "aws_subnet" "public" {
  count                   = local.public_subnets_count
  availability_zone       = element(values(local.public_subnets), count.index)
  cidr_block              = element(keys(local.public_subnets), count.index)
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.this[0].id
  tags = merge(
    module.public_subnet_label.tags,
    {
      "Name" = format(
        "%s%s%s",
        module.public_subnet_label.id,
        module.public_subnet_label.delimiter,
        element(values(local.public_subnets), count.index)
      )
    }
  )
}

#--------------------------------------------------------------
# Public Network ACL
#--------------------------------------------------------------

resource "aws_network_acl" "public" {
  count      = module.public_subnet_label.enabled ? 1 : 0
  vpc_id     = aws_vpc.this[0].id
  subnet_ids = aws_subnet.public[*].id
  tags       = module.public_label.tags
}

resource "aws_network_acl_rule" "public_ingress" {
  count           = module.public_subnet_label.enabled ? length(var.public_ingress_acl_rules) : 0
  network_acl_id  = aws_network_acl.public[0].id
  egress          = false
  rule_number     = var.public_ingress_acl_rules[count.index]["rule_number"]
  rule_action     = var.public_ingress_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.public_ingress_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.public_ingress_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.public_ingress_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.public_ingress_acl_rules[count.index], "icmp_type", null)
  protocol        = var.public_ingress_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.public_ingress_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.public_ingress_acl_rules[count.index], "ipv6_cidr_block", null)
}

#tfsec:ignore:aws-vpc-no-excessive-port-access
resource "aws_network_acl_rule" "public_egress" {
  count           = module.public_subnet_label.enabled ? length(var.public_egress_acl_rules) : 0
  network_acl_id  = aws_network_acl.public[0].id
  egress          = true
  rule_number     = var.public_egress_acl_rules[count.index]["rule_number"]
  rule_action     = var.public_egress_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.public_egress_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.public_egress_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.public_egress_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.public_egress_acl_rules[count.index], "icmp_type", null)
  protocol        = var.public_egress_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.public_egress_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.public_egress_acl_rules[count.index], "ipv6_cidr_block", null)
}

#--------------------------------------------------------------
# Public Route Table
#--------------------------------------------------------------

resource "aws_route_table" "public" {
  count  = module.public_subnet_label.enabled ? 1 : 0
  vpc_id = aws_vpc.this[0].id
  tags   = module.public_label.tags
}

#--------------------------------------------------------------
# Public Route
#--------------------------------------------------------------

resource "aws_route" "public" {
  count                  = module.public_subnet_label.enabled ? 1 : 0
  route_table_id         = element(aws_route_table.public[*].id, 0)
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this[0].id
}

#--------------------------------------------------------------
# Public Route Table Association
#--------------------------------------------------------------

resource "aws_route_table_association" "public" {
  count          = local.public_subnets_count
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = element(aws_route_table.public[*].id, 0)
}

#--------------------------------------------------------------
# Protected Subnets
#--------------------------------------------------------------

resource "aws_subnet" "protected" {
  count                   = local.protected_subnets_count
  availability_zone       = element(values(local.protected_subnets), count.index)
  cidr_block              = element(keys(local.protected_subnets), count.index)
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.this[0].id
  tags = merge(
    module.protected_subnet_label.tags,
    {
      "Name" = format(
        "%s%s%s",
        module.protected_subnet_label.id,
        module.protected_subnet_label.delimiter,
        element(values(local.protected_subnets), count.index)
      )
    }
  )
}

#--------------------------------------------------------------
# Protected Network ACL
#--------------------------------------------------------------

resource "aws_network_acl" "protected" {
  count      = module.protected_subnet_label.enabled ? 1 : 0
  vpc_id     = aws_vpc.this[0].id
  subnet_ids = aws_subnet.protected[*].id
  tags       = module.protected_label.tags
}

resource "aws_network_acl_rule" "protected_ingress" {
  count           = module.protected_subnet_label.enabled ? length(var.protected_ingress_acl_rules) : 0
  network_acl_id  = aws_network_acl.protected[0].id
  egress          = false
  rule_number     = var.protected_ingress_acl_rules[count.index]["rule_number"]
  rule_action     = var.protected_ingress_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.protected_ingress_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.protected_ingress_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.protected_ingress_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.protected_ingress_acl_rules[count.index], "icmp_type", null)
  protocol        = var.protected_ingress_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.protected_ingress_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.protected_ingress_acl_rules[count.index], "ipv6_cidr_block", null)
}

#tfsec:ignore:aws-vpc-no-excessive-port-access
resource "aws_network_acl_rule" "protected_egress" {
  count           = module.protected_subnet_label.enabled ? length(var.protected_egress_acl_rules) : 0
  network_acl_id  = aws_network_acl.protected[0].id
  egress          = true
  rule_number     = var.protected_egress_acl_rules[count.index]["rule_number"]
  rule_action     = var.protected_egress_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.protected_egress_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.protected_egress_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.protected_egress_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.protected_egress_acl_rules[count.index], "icmp_type", null)
  protocol        = var.protected_egress_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.protected_egress_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.protected_egress_acl_rules[count.index], "ipv6_cidr_block", null)
}

#--------------------------------------------------------------
# Protected Route Table
#--------------------------------------------------------------

resource "aws_route_table" "protected" {
  count  = local.protected_subnets_count
  vpc_id = aws_vpc.this[0].id
  tags = merge(
    module.protected_label.tags,
    {
      "Name" = format(
        "%s%s%s",
        module.protected_label.id,
        module.protected_label.delimiter,
        element(local.availability_zones, count.index)
      )
    }
  )
}

#--------------------------------------------------------------
# Protected Route Table Association
#--------------------------------------------------------------

resource "aws_route_table_association" "protected" {
  count          = local.protected_subnets_count
  subnet_id      = element(aws_subnet.protected[*].id, count.index)
  route_table_id = element(aws_route_table.protected[*].id, count.index)
}

#--------------------------------------------------------------
# Private Subnets
#--------------------------------------------------------------

resource "aws_subnet" "private" {
  count                   = local.private_subnets_count
  availability_zone       = element(values(local.private_subnets), count.index)
  cidr_block              = element(keys(local.private_subnets), count.index)
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.this[0].id
  tags = merge(
    module.private_subnet_label.tags,
    {
      "Name" = format(
        "%s%s%s",
        module.private_subnet_label.id,
        module.private_subnet_label.delimiter,
        element(values(local.private_subnets), count.index)
      )
    }
  )
}

#--------------------------------------------------------------
# Private Network ACL
#--------------------------------------------------------------

resource "aws_network_acl" "private" {
  count      = module.private_subnet_label.enabled ? 1 : 0
  vpc_id     = aws_vpc.this[0].id
  subnet_ids = aws_subnet.private[*].id
  tags       = module.private_label.tags
}

resource "aws_network_acl_rule" "private_ingress" {
  count           = module.private_subnet_label.enabled ? length(var.private_ingress_acl_rules) : 0
  network_acl_id  = aws_network_acl.private[0].id
  egress          = false
  rule_number     = var.private_ingress_acl_rules[count.index]["rule_number"]
  rule_action     = var.private_ingress_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.private_ingress_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.private_ingress_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.private_ingress_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.private_ingress_acl_rules[count.index], "icmp_type", null)
  protocol        = var.private_ingress_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.private_ingress_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.private_ingress_acl_rules[count.index], "ipv6_cidr_block", null)
}

#tfsec:ignore:aws-vpc-no-excessive-port-access
resource "aws_network_acl_rule" "private_egress" {
  count           = module.private_subnet_label.enabled ? length(var.private_egress_acl_rules) : 0
  network_acl_id  = aws_network_acl.private[0].id
  egress          = true
  rule_number     = var.private_egress_acl_rules[count.index]["rule_number"]
  rule_action     = var.private_egress_acl_rules[count.index]["rule_action"]
  from_port       = lookup(var.private_egress_acl_rules[count.index], "from_port", null)
  to_port         = lookup(var.private_egress_acl_rules[count.index], "to_port", null)
  icmp_code       = lookup(var.private_egress_acl_rules[count.index], "icmp_code", null)
  icmp_type       = lookup(var.private_egress_acl_rules[count.index], "icmp_type", null)
  protocol        = var.private_egress_acl_rules[count.index]["protocol"]
  cidr_block      = lookup(var.private_egress_acl_rules[count.index], "cidr_block", null)
  ipv6_cidr_block = lookup(var.private_egress_acl_rules[count.index], "ipv6_cidr_block", null)
}

#--------------------------------------------------------------
# Private Route Table
#--------------------------------------------------------------

resource "aws_route_table" "private" {
  count  = module.private_subnet_label.enabled ? 1 : 0
  vpc_id = aws_vpc.this[0].id
  tags   = module.private_label.tags
}

#--------------------------------------------------------------
# Private Route Table Association
#--------------------------------------------------------------

resource "aws_route_table_association" "private" {
  count          = local.private_subnets_count
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = element(aws_route_table.private[*].id, 0)
}

#--------------------------------------------------------------
# EIP
#--------------------------------------------------------------

resource "aws_eip" "this" {
  count = module.nat_label.enabled ? local.availability_zones_count : 0
  vpc   = true
  tags = merge(
    module.nat_label.tags,
    {
      "Name" = format(
        "%s%s%s",
        module.nat_label.id,
        module.nat_label.delimiter,
        element(local.availability_zones, count.index)
      )
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

#--------------------------------------------------------------
# NAT Gateway
#--------------------------------------------------------------

resource "aws_nat_gateway" "this" {
  count         = module.nat_label.enabled ? local.availability_zones_count : 0
  allocation_id = element(aws_eip.this[*].id, count.index)
  subnet_id     = element(aws_subnet.public[*].id, count.index)
  tags = merge(
    module.nat_label.tags,
    {
      "Name" : format(
        "%s%s%s",
        module.nat_label.id,
        module.nat_label.delimiter,
        element(local.availability_zones, count.index)
      )
    }
  )

  lifecycle {
    create_before_destroy = true
  }
}

#--------------------------------------------------------------
# NAT Route
#--------------------------------------------------------------

resource "aws_route" "nat" {
  count                  = module.nat_label.enabled ? local.availability_zones_count : 0
  route_table_id         = element(aws_route_table.protected[*].id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.this[*].id, count.index)
  depends_on = [
    aws_route_table.protected
  ]
}

#--------------------------------------------------------------
# S3 VPC Endpoint
#--------------------------------------------------------------

data "aws_vpc_endpoint_service" "s3" {
  count        = module.s3_vpc_endpoint_label.enabled ? 1 : 0
  service      = "s3"
  service_type = "Gateway"
}

resource "aws_vpc_endpoint" "s3" {
  count             = module.s3_vpc_endpoint_label.enabled ? 1 : 0
  service_name      = data.aws_vpc_endpoint_service.s3[0].service_name
  vpc_id            = aws_vpc.this[0].id
  tags              = module.s3_vpc_endpoint_label.tags
  vpc_endpoint_type = "Gateway"
}

resource "aws_vpc_endpoint_route_table_association" "protected_s3" {
  count           = module.s3_vpc_endpoint_label.enabled && module.protected_label.enabled ? local.availability_zones_count : 0
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = element(aws_route_table.protected[*].id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private_s3" {
  count           = module.s3_vpc_endpoint_label.enabled && module.private_label.enabled ? local.availability_zones_count : 0
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = element(aws_route_table.private[*].id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "public_s3" {
  count           = module.s3_vpc_endpoint_label.enabled && module.public_label.enabled ? local.availability_zones_count : 0
  vpc_endpoint_id = aws_vpc_endpoint.s3[0].id
  route_table_id  = element(aws_route_table.public[*].id, count.index)
}

#--------------------------------------------------------------
# DynamoDB VPC Endpoint
#--------------------------------------------------------------

data "aws_vpc_endpoint_service" "dynamodb" {
  count        = module.dynamodb_vpc_endpoint_label.enabled ? 1 : 0
  service      = "dynamodb"
  service_type = "Gateway"
}

resource "aws_vpc_endpoint" "dynamodb" {
  count             = module.dynamodb_vpc_endpoint_label.enabled ? 1 : 0
  service_name      = data.aws_vpc_endpoint_service.dynamodb[0].service_name
  vpc_id            = aws_vpc.this[0].id
  tags              = module.dynamodb_vpc_endpoint_label.tags
  vpc_endpoint_type = "Gateway"
}

resource "aws_vpc_endpoint_route_table_association" "protected_dynamodb" {
  count           = module.dynamodb_vpc_endpoint_label.enabled && module.protected_label.enabled ? local.availability_zones_count : 0
  vpc_endpoint_id = aws_vpc_endpoint.dynamodb[0].id
  route_table_id  = element(aws_route_table.protected[*].id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "private_dynamodb" {
  count           = module.dynamodb_vpc_endpoint_label.enabled && module.private_label.enabled ? local.availability_zones_count : 0
  vpc_endpoint_id = aws_vpc_endpoint.dynamodb[0].id
  route_table_id  = element(aws_route_table.private[*].id, count.index)
}

resource "aws_vpc_endpoint_route_table_association" "public_dynamodb" {
  count           = module.dynamodb_vpc_endpoint_label.enabled && module.public_label.enabled ? local.availability_zones_count : 0
  vpc_endpoint_id = aws_vpc_endpoint.dynamodb[0].id
  route_table_id  = element(aws_route_table.public[*].id, count.index)
}
