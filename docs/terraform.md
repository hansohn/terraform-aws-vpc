## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13.0 |
| aws | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| default_label | cloudposse/label/null | 0.24.1 |
| dynamodb_vpc_endpoint_label | cloudposse/label/null | 0.24.1 |
| igw_label | cloudposse/label/null | 0.24.1 |
| intra_label | cloudposse/label/null | 0.24.1 |
| intra_subnet_label | cloudposse/label/null | 0.24.1 |
| nat_label | cloudposse/label/null | 0.24.1 |
| private_label | cloudposse/label/null | 0.24.1 |
| private_subnet_label | cloudposse/label/null | 0.24.1 |
| public_label | cloudposse/label/null | 0.24.1 |
| public_subnet_label | cloudposse/label/null | 0.24.1 |
| s3_vpc_endpoint_label | cloudposse/label/null | 0.24.1 |
| this | cloudposse/label/null | 0.24.1 |
| vpc_label | cloudposse/label/null | 0.24.1 |

## Resources

| Name |
|------|
| [aws_availability_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) |
| [aws_default_network_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_network_acl) |
| [aws_default_security_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/default_security_group) |
| [aws_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) |
| [aws_internet_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) |
| [aws_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) |
| [aws_network_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl) |
| [aws_network_acl_rule](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/network_acl_rule) |
| [aws_region](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) |
| [aws_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) |
| [aws_route_table](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) |
| [aws_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) |
| [aws_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) |
| [aws_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) |
| [aws_vpc_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) |
| [aws_vpc_endpoint_route_table_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_route_table_association) |
| [aws_vpc_endpoint_service](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc_endpoint_service) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tag\_map | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| assign\_generated\_ipv6\_cidr\_block | (Optional) Requests an Amazon-provided IPv6 CIDR block with a /56 prefix length for the VPC. You cannot specify the range of IP addresses, or the size of the CIDR block. Default is false. | `bool` | `null` | no |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| availability\_zones | (Optional) Specific Availabilty Zones to use when creating network resources. Does not run a zone state check before implmenting. Conflicts with 'max\_availability\_zones' | `list(string)` | `[]` | no |
| cidr\_block | (Required) The CIDR block for the VPC. | `string` | n/a | yes |
| context | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| default\_network\_acl\_egress | List of maps of egress rules to set on the Default Network ACL | `list(any)` | <pre>[<br>  {<br>    "action": "allow",<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_no": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| default\_network\_acl\_ingress | List of maps of ingress rules to set on the Default Network ACL | `list(any)` | <pre>[<br>  {<br>    "action": "allow",<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_no": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| default\_security\_group\_egress | List of maps of egress rules to set on the default security group | `list(any)` | <pre>[<br>  {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>]</pre> | no |
| default\_security\_group\_ingress | List of maps of ingress rules to set on the default security group | `list(any)` | <pre>[<br>  {<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "self": true,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| enable\_classiclink | (Optional) A boolean flag to enable/disable ClassicLink for the VPC. Only valid in regions and accounts that support EC2 Classic. See the ClassicLink documentation for more information. Defaults false. | `bool` | `null` | no |
| enable\_classiclink\_dns\_support | (Optional) A boolean flag to enable/disable ClassicLink DNS Support for the VPC. Only valid in regions and accounts that support EC2 Classic. | `bool` | `null` | no |
| enable\_dns\_hostnames | (Optional) A boolean flag to enable/disable DNS hostnames in the VPC. Defaults false. | `bool` | `null` | no |
| enable\_dns\_support | (Optional) A boolean flag to enable/disable DNS support in the VPC. Defaults true. | `bool` | `null` | no |
| enable\_internet\_gateway | A boolean flag to enable/disable internet gateway creation | `bool` | `false` | no |
| enable\_intra\_network | Enables intra network resource creation | `bool` | `true` | no |
| enable\_private\_network | Enables private network resource creation | `bool` | `true` | no |
| enable\_public\_network | Enables public network resource creation | `bool` | `true` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| environment | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| exclude\_names | (Optional) List of Availability Zone names to exclude. | `list(string)` | `null` | no |
| exclude\_zone\_ids | (Optional) List of Availability Zone IDs to exclude. | `list(string)` | `null` | no |
| id\_length\_limit | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| instance\_tenancy | (Optional) A tenancy option for instances launched into the VPC. Default is default, which makes your instances shared on the host. Using either of the other options (dedicated or host) costs at least $2/hr. | `string` | `null` | no |
| intra\_egress\_acl\_rules | Intra subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| intra\_ingress\_acl\_rules | Intra subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| label\_key\_case | The letter case of label keys (`tag` names) (i.e. `name`, `namespace`, `environment`, `stage`, `attributes`) to use in `tags`.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| label\_order | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| label\_value\_case | The letter case of output label values (also used in `tags` and `id`).<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Default value: `lower`. | `string` | `null` | no |
| manage\_default\_network\_acl | A boolean flag to enable/disable management of the default network acl | `bool` | `false` | no |
| manage\_default\_security\_group | A boolean flag to enable/disable management of the default security group | `bool` | `false` | no |
| max\_availability\_zones | (Optional) Number of desired Availabilty Zones to use when creating network resources. Runs a zone state check before implmenting. Uses all available zones when set to null. Conflicts with 'availability\_zones' | `number` | `null` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| private\_egress\_acl\_rules | Private subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| private\_ingress\_acl\_rules | Private subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| public\_egress\_acl\_rules | Public subnets outbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| public\_ingress\_acl\_rules | Public subnets inbound network ACLs | `list(map(string))` | <pre>[<br>  {<br>    "cidr_block": "0.0.0.0/0",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "rule_action": "allow",<br>    "rule_number": 100,<br>    "to_port": 0<br>  }<br>]</pre> | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| availability\_zones | List of utilized availability zones |
| default\_network\_acl\_arn | The ARN of the Default Network ACL |
| default\_network\_acl\_id | The ID of the Default Network ACL |
| default\_network\_acl\_owner\_id | The ID of the AWS account that owns the Default Network ACL |
| default\_network\_acl\_subnet\_ids | IDs of associated Subnets |
| default\_network\_acl\_vpc\_id | The ID of the associated VPC |
| default\_security\_group\_arn | The ARN of the security group |
| default\_security\_group\_description | The description of the security group |
| default\_security\_group\_id | The ID of the security group |
| default\_security\_group\_name | The name of the security group |
| default\_security\_group\_owner\_id | The owner ID. |
| default\_security\_group\_vpc\_id | The VPC ID. |
| igw\_arn | The ARN of the Internet Gateway. |
| igw\_id | The ID of the Internet Gateway. |
| igw\_owner\_id | The ID of the AWS account that owns the internet gateway. |
| intra\_route\_table\_id | The ID of the Intra routing table. |
| intra\_route\_table\_owner\_id | The ID of the AWS account that owns the Intra route table. |
| intra\_subnet\_arns | The ARNs of the Intra subnets. |
| intra\_subnet\_cidr\_blocks | The CIDR blocks of the created Intra subnets |
| intra\_subnet\_ids | The IDs of the Intra subnets |
| intra\_subnet\_ipv6\_cidr\_block\_association\_ids | The association IDs for the IPv6 CIDR blocks of the Intra subnets. |
| intra\_subnet\_owner\_ids | The ID of the AWS account that owns the Intra subnets. |
| private\_route\_table\_ids | The ID of the Private routing table. |
| private\_route\_table\_owner\_ids | The ID of the AWS account that owns the Private route table. |
| private\_subnet\_arns | The ARNs of the Private subnets. |
| private\_subnet\_cidr\_blocks | The CIDR blocks of the created Private subnets |
| private\_subnet\_ids | The IDs of the Private subnets |
| private\_subnet\_ipv6\_cidr\_block\_association\_ids | The association IDs for the IPv6 CIDR blocks of the Private subnets. |
| private\_subnet\_owner\_ids | The ID of the AWS account that owns the Private subnets. |
| public\_route\_table\_id | The ID of the Public routing table. |
| public\_route\_table\_owner\_id | The ID of the AWS account that owns the Public route table. |
| public\_subnet\_arns | The ARNs of the Public subnets. |
| public\_subnet\_cidr\_blocks | The CIDR blocks of the created Public subnets |
| public\_subnet\_ids | The IDs of the Public subnets |
| public\_subnet\_ipv6\_cidr\_block\_association\_ids | The association IDs for the IPv6 CIDR blocks of the Public subnets. |
| public\_subnet\_owner\_ids | The ID of the AWS account that owns the Public subnets. |
| vpc\_arn | Amazon Resource Name (ARN) of VPC |
| vpc\_cidr\_block | The CIDR block of the VPC |
| vpc\_default\_network\_acl\_id | The ID of the network ACL created by default on VPC creation |
| vpc\_default\_route\_table\_id | The ID of the route table created by default on VPC creation |
| vpc\_default\_security\_group\_id | The ID of the security group created by default on VPC creation |
| vpc\_enable\_classiclink | Whether or not the VPC has Classiclink enabled |
| vpc\_enable\_dns\_hostnames | Whether or not the VPC has DNS hostname support |
| vpc\_enable\_dns\_support | Whether or not the VPC has DNS support |
| vpc\_id | The ID of the VPC |
| vpc\_instance\_tenancy | Tenancy of instances spin up within VPC. |
| vpc\_ipv6\_association\_id | The association ID for the IPv6 CIDR block. |
| vpc\_ipv6\_cidr\_block | The IPv6 CIDR block. |
| vpc\_main\_route\_table\_id | The ID of the main route table associated with this VPC. Note that you can change a VPC's main route table by using an aws\_main\_route\_table\_association. |
| vpc\_owner\_id | The ID of the AWS account that owns the VPC. |
