provider "aws" {
  region = var.region
}

module "vpc" {
  source  = "../../"
  context = module.this.context

  # general
  cidr_block                       = var.cidr_block
  availability_zones               = var.availability_zones
  enable_dns_support               = var.enable_dns_support
  enable_dns_hostnames             = var.enable_dns_hostnames
  assign_generated_ipv6_cidr_block = var.assign_generated_ipv6_cidr_block
  enable_internet_gateway          = var.enable_internet_gateway

  # default acls
  default_network_acl_ingress = var.default_network_acl_ingress
  default_network_acl_egress  = var.default_network_acl_egress

  # public acls
  public_ingress_acl_rules = var.public_ingress_acl_rules
  public_egress_acl_rules  = var.public_egress_acl_rules

  # private acls
  private_ingress_acl_rules = var.private_ingress_acl_rules
  private_egress_acl_rules  = var.private_egress_acl_rules

  # intra acls
  intra_ingress_acl_rules = var.intra_ingress_acl_rules
  intra_egress_acl_rules  = var.intra_egress_acl_rules
}
