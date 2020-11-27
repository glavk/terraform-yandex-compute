data "yandex_compute_image" "this" {
  family    = var.image_family
  folder_id = var.folder_id
}

data "yandex_vpc_subnet" "this" {
  zone = var.zones[0]
  name = var.subnet
}

resource "yandex_compute_instance" "this" {
  name        = var.name
  platform_id = var.platform_id
  zone        = var.zones[0]

  hostname = var.hostname

  resources {
    cores         = var.cores
    memory        = var.memory
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.this.id
      type     = "network-ssd"
      size     = var.size
    }
  }

  network_interface {
    subnet_id          = data.yandex_vpc_subnet.this.id
    nat                = var.is_nat
    nat_ip_address     = var.nat_ip_address
    security_group_ids = var.sg_id
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${file("${var.ssh_pubkey}")}"
  }

  depends_on = [
    yandex_vpc_subnet.this
  ]
}
