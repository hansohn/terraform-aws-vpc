# route

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_destination_cidr_block"></a> [destination\_cidr\_block](#input\_destination\_cidr\_block) | (Optional) The destination CIDR block. | `string` | `null` | no |
| <a name="input_destination_ipv6_cidr_block"></a> [destination\_ipv6\_cidr\_block](#input\_destination\_ipv6\_cidr\_block) | (Optional) The destination IPv6 CIDR block. | `string` | `null` | no |
| <a name="input_egress_only_gateway_id"></a> [egress\_only\_gateway\_id](#input\_egress\_only\_gateway\_id) | (Optional) Identifier of a VPC Egress Only Internet Gateway. | `string` | `null` | no |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | (Optional) Identifier of a VPC internet gateway or a virtual private gateway. | `string` | `null` | no |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | (Optional) Identifier of an EC2 instance. | `string` | `null` | no |
| <a name="input_local_gateway_id"></a> [local\_gateway\_id](#input\_local\_gateway\_id) | (Optional) Identifier of a Outpost local gateway. | `string` | `null` | no |
| <a name="input_nat_gateway_id"></a> [nat\_gateway\_id](#input\_nat\_gateway\_id) | (Optional) Identifier of a VPC NAT gateway. | `string` | `null` | no |
| <a name="input_network_interface_id"></a> [network\_interface\_id](#input\_network\_interface\_id) | (Optional) Identifier of an EC2 network interface. | `string` | `null` | no |
| <a name="input_route_table_id"></a> [route\_table\_id](#input\_route\_table\_id) | (Required) The ID of the routing table. | `string` | `null` | no |
| <a name="input_transit_gateway_id"></a> [transit\_gateway\_id](#input\_transit\_gateway\_id) | (Optional) Identifier of an EC2 Transit Gateway. | `string` | `null` | no |
| <a name="input_vpc_peering_connection_id"></a> [vpc\_peering\_connection\_id](#input\_vpc\_peering\_connection\_id) | (Optional) Identifier of a VPC peering connection. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | Route Table identifier and destination |
<!-- END_TF_DOCS -->
