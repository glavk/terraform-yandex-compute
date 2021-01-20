data "yandex_compute_image" "this" {
  family    = var.image_family
  folder_id = var.folder_id
}

data "yandex_compute_disk" "secondary_disk" {
  disk_id = var.secondary_disk_id[0]
}

data "yandex_vpc_subnet" "this" {
  name = var.subnet
}

resource "yandex_compute_instance" "this" {
  count = var.instance_count

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

  dynamic "secondary_disk" {
    for_each = var.secondary_disk_id
    content {
      disk_id = data.yandex_compute_disk.secondary_disk.id
    }
  }

  network_interface {
    subnet_id          = data.yandex_vpc_subnet.this.id
    nat                = var.is_nat
    nat_ip_address     = var.nat_ip_address
    security_group_ids = var.sg_id
    ip_address         = var.ip_address
  }

  scheduling_policy {
    preemptible = var.preemptible
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${file("${var.ssh_pubkey}")}"
  }

  allow_stopping_for_update = true

  depends_on = [
    data.yandex_vpc_subnet.this
  ]
}
