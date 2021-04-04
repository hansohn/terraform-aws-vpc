#--------------------------------------------------------------
# Subnet
#--------------------------------------------------------------

locals {
  availability_zones_count = max(length(var.availability_zones), length(var.availability_zone_ids), 1)
  dynamic = max(length(var.availability_zones), length(var.availability_zone_ids)) > 0 ? true : false
  netnum_base = local.dynamic && var.subnet_type == "public" ? local.availability_zones_count : 0
}

resource "aws_subnet" "this" {
  count = module.this.enabled ? local.availability_zones_count : 0
  availability_zone = coalesce(var.availability_zone, element(var.availability_zones, count.index))
  availability_zone_id = coalesce(var.availability_zone_id, element(var.availability_zone_ids, count.index))
  cidr_block = cidrsubnet(
    var.cidr_block,
    local.dynamic ? ceil(log(local.availability_zones_count * 2, 2)) : 0,
    local.netnum_base + count.index
  )
  ipv6_cidr_block = cidrsubnet(
    var.ipv6_cidr_block,
    local.dynamic ? ceil(log(local.availability_zones_count * 2, 2)) : 0,
    local.netnum_base + count.index
  )
  map_public_ip_on_launch = var.map_public_ip_on_launch
  outpost_arn = var.outpost_arn
  assign_ipv6_address_on_creation = var.assign_ipv6_address_on_creation
  vpc_id = var.vpc_id
  tags = merge(
    module.this.tags,
    {
      "Name" = format(
        "%s%s%s",
        module.this.id,
        module.this.delimiter,
        coalesce(var.availability_zone, element(var.availability_zones, count.index))
      )
    }
  )
}
