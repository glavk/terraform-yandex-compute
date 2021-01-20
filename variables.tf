variable "instance_count" {
  description = "Yandex Cloud Compute instance count"
  type        = number
  default     = 1
}

variable "platform_id" {
  description = "The type of virtual machine to create"
  type        = string
  default     = "standard-v2"
}
variable "folder_id" {
  description = "Yandex Cloud Folder ID where resources will be created"
  type        = string
}

variable "image_family" {
  description = "Yandex Cloud Compute Image family"
  type        = string
}

variable "zones" {
  description = "Yandex Cloud Zones for provisoned resources"
  type        = list(string)
  default     = ["ru-central1-a", "ru-central1-b", "ru-central1-c"]
}

variable "name" {
  description = "Yandex Cloud Compute instance name"
  type        = string
}

# The hostname must be unique within the network and region
# If not specified, the host name will be equal to id of the instance and fqdn will be <id>.auto.internal
# Otherwise FQDN will be <hostname>.<region_id>.internal
variable "hostname" {
  description = "Host name for the instance. This field is used to generate the instance fqdn value"
  type        = string
}

# Preemtible VM: https://cloud.yandex.ru/docs/compute/concepts/preemptible-vm
variable "preemptible" {
  description = "Specifies if the instance is preemptible"
  type        = bool
  default     = false
}

variable "is_nat" {
  description = "Provide a public address for instance to access the internet over NAT"
  type        = bool
  default     = false
}

variable "size" {
  description = "Size of the boot disk in GB"
  type        = string
  default     = "10"
}

variable "cores" {
  description = "CPU cores for the instance"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory size for the instance in GB"
  type        = number
  default     = 2
}

variable "core_fraction" {
  description = "Baseline performance for a core as a percent"
  type        = number
  default     = 100
}

variable "subnet" {
  description = "Yandex VPC subnet"
  type        = string
}

variable "sg_id" {
  description = "Security group ids for network interface"
  type        = list(string)
}

# IP address should be already reserved in web UI
variable "nat_ip_address" {
  description = "Public IP address for instance to access the internet over NAT"
  type        = string
  default     = ""
}

variable "ip_address" {
  description = "The private IP address to assign to the instance. If empty, the address will be automatically assigned from the specified subnet"
  type        = string
  default     = ""
}

variable "ssh_username" {
  description = "User for SSH access to the instance"
  type        = string
  default     = "ubuntu"
}

variable "ssh_pubkey" {
  description = "SSH public key for access to the instance"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "secondary_disk_id" {
  description = "ID of the disk that is attached to the instance"
  type        = list(string)
  default     = []
}
