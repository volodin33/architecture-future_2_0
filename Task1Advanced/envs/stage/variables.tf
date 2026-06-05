variable "cloud_id" {
  description = "ID облака Yandex Cloud."
  type        = string
}

variable "folder_id" {
  description = "ID каталога Yandex Cloud."
  type        = string
}

variable "zone" {
  description = "Зона доступности."
  type        = string
}

variable "name" {
  description = "Имя ВМ."
  type        = string
}

variable "cores" {
  description = "Количество vCPU."
  type        = number
}

variable "memory" {
  description = "RAM в ГБ."
  type        = number
}

variable "disk_size" {
  description = "Размер подключаемого диска в ГБ."
  type        = number
}

variable "image_id" {
  description = "ID образа загрузочного диска."
  type        = string
}

variable "subnet_id" {
  description = "ID подсети."
  type        = string
}

variable "ssh_key" {
  description = "Публичный SSH-ключ."
  type        = string
}
