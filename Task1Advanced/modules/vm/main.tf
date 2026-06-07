terraform {
  required_version = ">= 1.3.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.89"
    }
  }
}

resource "yandex_compute_disk" "data" {
  name = "${var.name}-data"
  zone = var.zone
  size = var.disk_size
}

resource "yandex_compute_instance" "this" {
  name = var.name
  zone = var.zone

  resources {
    cores  = var.cores
    memory = var.memory
  }

  boot_disk {
    initialize_params {
      image_id = var.image_id
    }
  }

  secondary_disk {
    disk_id = yandex_compute_disk.data.id
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${var.ssh_key}"
  }

  labels = {
    environment = var.environment
  }
}
