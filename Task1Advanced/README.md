# Terraform-модуль 

Модуль `vm` (Yandex Cloud) создаёт виртуальную машину с подключаемым диском и сетевым интерфейсом. Один модуль переиспользуется в окружениях **dev / stage / prod** — различия только в значениях `*.tfvars`.

## Структура

```
Task1Advanced/
├── modules/vm/
│   ├── main.tf       # ВМ + подключаемый диск + сеть
│   ├── variables.tf  # входные параметры
│   └── outputs.tf    # выходы
└── envs/
    ├── dev/   (main.tf, variables.tf, outputs.tf, dev.tfvars)
    ├── stage/ (..., stage.tfvars)
    └── prod/  (..., prod.tfvars)
```

В модуле нет захардкоженных значений окружений — всё через переменные.

## Параметры модуля

| Имя | Тип | По умолчанию | Описание |
|---|---|---|---|
| `name` | string | — | Имя ВМ |
| `zone` | string | — | Зона доступности |
| `cores` | number | — | Количество vCPU |
| `memory` | number | — | RAM в ГБ |
| `image_id` | string | — | ID образа загрузочного диска |
| `disk_size` | number | `10` | Размер подключаемого диска (ГБ) |
| `subnet_id` | string | — | ID подсети |
| `ssh_key` | string | — | Публичный SSH-ключ |
| `environment` | string | — | Имя окружения (метка) |

## Выходы модуля

| Выход | Описание |
|---|---|
| `vm_id` | ID виртуальной машины |
| `vm_name` | Имя ВМ |
| `internal_ip` | Внутренний IP |
| `external_ip` | Внешний IP |
| `disk_id` | ID подключаемого диска |

## Конфигурации окружений

| Параметр | dev | stage | prod |
|---|---|---|---|
| cores | 2 | 2 | 4 |
| memory, ГБ | 2 | 4 | 8 |
| disk_size, ГБ | 10 | 20 | 40 |

## Запуск

Нужен Terraform (>= 1.3) и аутентификация в Yandex Cloud. В `*.tfvars` подставьте свои `cloud_id`, `folder_id`, `subnet_id`, `image_id`, `ssh_key`.

```bash
cd envs/dev
terraform init
terraform plan  -var-file=dev.tfvars
terraform apply -var-file=dev.tfvars
```

Для stage/prod — аналогично из соответствующей папки с `-var-file=stage.tfvars` / `prod.tfvars`.

