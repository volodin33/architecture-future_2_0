variable "name" {
  description = "Имя ВМ (используется для instance, диска и hostname)."
  type        = string
}

variable "zone" {
  description = "Зона доступности (например, ru-central1-a)."
  type        = string
}

variable "cores" {
  description = "Количество vCPU."
  type        = number
}

variable "memory" {
  description = "Объём RAM в ГБ."
  type        = number
}

variable "image_id" {
  description = "ID образа загрузочного диска (Ubuntu из Marketplace)."
  type        = string
}

variable "disk_size" {
  description = "Размер подключаемого диска в ГБ."
  type        = number
  default     = 10
}

variable "subnet_id" {
  description = "ID подсети для сетевого интерфейса."
  type        = string
}

variable "ssh_key" {
  description = "Публичный SSH-ключ для доступа к ВМ."
  type        = string
}

variable "environment" {
  description = "Имя окружения (dev/stage/prod) — попадает в метки."
  type        = string
}
