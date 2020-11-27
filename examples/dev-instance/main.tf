provider "yandex" {
  service_account_key_file = "key.json"
  folder_id                = "xxx"
  zone                     = "ru-central1-a"
}

terraform {
  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "terraform-dev-state"
    region     = "us-east-1"
    key        = "dev/terraform.tfstate"
    access_key = "xxx"
    secret_key = "xxx"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}

module "compute" {
  source  = "glavk/compute/yandex"
  version = "0.1.2"

  image_family = "ubuntu-docker"
  subnet       = "sn-dev-0"
  folder_id    = "xxx"

  name     = "development"
  hostname = "dev"
  is_nat   = true

  cores  = 2
  memory = 4
  size   = "10"

  preemptible = true

  sg_id = ["xxx"]

}
