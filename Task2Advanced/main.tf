resource "random_pet" "vm_name" {
  prefix = "future-${var.environment}"
  length = 2
}

resource "null_resource" "vm" {
  triggers = {
    name        = random_pet.vm_name.id
    environment = var.environment
  }
}
