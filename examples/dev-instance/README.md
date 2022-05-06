# Simple Compute instance

Configuration in this directory creates [preemptible compute instance](https://cloud.yandex.ru/docs/compute/concepts/preemptible-vm) with dynamic public IP (via NAT).

## Usage

To run this example you need to execute:

```shell
terraform init
terraform plan
terraform apply
```

Please note that this example create resources which cost money. 

Run `terraform destroy` when you don't need these resources.