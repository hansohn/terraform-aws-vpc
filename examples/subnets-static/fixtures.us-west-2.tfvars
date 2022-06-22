region = "us-west-2"

namespace = "eg"
stage     = "test"
name      = "vpc"

cidr_block                       = "10.0.0.0/22"
enable_dns_support               = true
enable_dns_hostnames             = true
assign_generated_ipv6_cidr_block = true
enable_internet_gateway          = true

enable_dynamic_subnets = false
enable_public_network  = true
public_subnet_cidrs = {
  "us-west-2a" : ["10.0.0.0/26"],
  "us-west-2b" : ["10.0.0.64/26"],
  "us-west-2c" : ["10.0.0.128/26"],
  "us-west-2d" : ["10.0.0.192/26"],
}
enable_protected_network = true
protected_subnet_cidrs = {
  "us-west-2a" : ["10.0.1.0/26"],
  "us-west-2b" : ["10.0.1.64/26"],
  "us-west-2c" : ["10.0.1.128/26"],
  "us-west-2d" : ["10.0.1.192/26"],
}
enable_private_network = true
private_subnet_cidrs = {
  "us-west-2a" : ["10.0.2.0/26"],
  "us-west-2b" : ["10.0.2.64/26"],
  "us-west-2c" : ["10.0.2.128/26"],
  "us-west-2d" : ["10.0.2.192/26"],
}

default_network_acl_ingress = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
  {
    rule_no         = 101
    action          = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    ipv6_cidr_block = "::/0"
  },
]
default_network_acl_egress = [
  {
    rule_no    = 100
    action     = "allow"
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = "0.0.0.0/0"
  },
  {
    rule_no         = 101
    action          = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    ipv6_cidr_block = "::/0"
  },
]

public_ingress_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
  },
  {
    rule_number     = 101
    rule_action     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    ipv6_cidr_block = "::/0"
  },
]
public_egress_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
  },
  {
    rule_number     = 101
    rule_action     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    ipv6_cidr_block = "::/0"
  },
]

protected_ingress_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
  },
  {
    rule_number     = 101
    rule_action     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    ipv6_cidr_block = "::/0"
  },
]
protected_egress_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
  },
  {
    rule_number     = 101
    rule_action     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    ipv6_cidr_block = "::/0"
  },
]

private_ingress_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
  },
  {
    rule_number     = 101
    rule_action     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    ipv6_cidr_block = "::/0"
  },
]
private_egress_acl_rules = [
  {
    rule_number = 100
    rule_action = "allow"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = "0.0.0.0/0"
  },
  {
    rule_number     = 101
    rule_action     = "allow"
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    ipv6_cidr_block = "::/0"
  },
]
