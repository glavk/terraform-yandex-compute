# Terraform module for Yandex.Cloud Compute

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.13 |
| yandex | >= 0.47.0 |

## Providers

| Name | Version |
|------|---------|
| yandex | >= 0.47.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| core\_fraction | Baseline performance for a core as a percent | `number` | `100` | no |
| cores | CPU cores for the instance | `number` | `2` | no |
| folder\_id | Yandex Cloud Folder ID where resources will be created | `string` | n/a | yes |
| hostname | Host name for the instance. This field is used to generate the instance fqdn value | `string` | n/a | yes |
| image\_family | Yandex Cloud Compute Image family | `string` | n/a | yes |
| is\_nat | Provide a public address for instance to access the internet over NAT | `bool` | `false` | no |
| memory | Memory size for the instance in GB | `number` | `2` | no |
| name | Yandex Cloud Compute (VM) name | `string` | n/a | yes |
| nat\_ip\_address | Public IP address for instance to access the internet over NAT | `string` | `""` | no |
| platform\_id | The type of virtual machine to create | `string` | `"standard-v2"` | no |
| preemptible | Specifies if the instance is preemptible | `bool` | `false` | no |
| sg\_id | Security group ids for network interface | `list(string)` | n/a | yes |
| size | Size of the boot disk in GB | `string` | `"10"` | no |
| ssh\_pubkey | SSH public key for access to the instance | `string` | `"~/.ssh/id_rsa.pub"` | no |
| ssh\_username | User for SSH access to the instance | `string` | `"ubuntu"` | no |
| subnet | Yandex VPC subnet | `string` | n/a | yes |
| zones | Yandex Cloud Zones for provisoned resources | `list(string)` | <pre>[<br>  "ru-central1-a",<br>  "ru-central1-b",<br>  "ru-central1-c"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| compute\_instance\_external\_ip | The external IP address of the instance |
| compute\_instance\_fqdn | The fully qualified DNS name of this instance |
| compute\_instance\_internal\_ip | The internal IP address of the instance |

