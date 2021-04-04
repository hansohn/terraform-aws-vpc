#--------------------------------------------------------------
# Internet Gateway
#--------------------------------------------------------------

resource "aws_internet_gateway" "this" {
  count = module.this.enabled ? 1 : 0
  vpc_id = var.vpc_id
  tags = module.this.tags

  lifecycle {
    create_before_destroy = true
  }
}
