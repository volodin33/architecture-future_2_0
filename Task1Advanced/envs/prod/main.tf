terraform {
  required_version = ">= 1.3.0"

  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = ">= 0.89"
    }
  }
}

provider "yandex" {
  cloud_id  = var.cloud_id
  folder_id = var.folder_id
  zone      = var.zone
}

module "vm" {
  source = "../../modules/vm"

  name        = var.name
  zone        = var.zone
  cores       = var.cores
  memory      = var.memory
  disk_size   = var.disk_size
  image_id    = var.image_id
  subnet_id   = var.subnet_id
  ssh_key     = var.ssh_key
  environment = "prod"
}
