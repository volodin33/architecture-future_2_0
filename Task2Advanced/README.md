# Task2Advanced — Jenkins CI/CD + удалённый state (MinIO)

CI/CD-пайплайн с удалённым Terraform-state в S3-совместимом MinIO. Всё локально в Docker: MinIO — хранилище, Jenkins — CI/CD, Terraform запускается отдельным контейнером. Демо-ресурс — `random`/`null` (не настоящая ВМ), чтобы не зависеть от облака.

## Состав

```
docker-compose.yml   MinIO (+ бакет tfstate) + Jenkins
jenkins.Dockerfile   Jenkins + docker CLI
Jenkinsfile          пайплайн fmt→init→validate→plan→approval→apply
backend.tf           backend "s3" → MinIO
backend.tfvars       endpoint в docker-сети (minio:9000)
backend.host.tfvars  endpoint с хоста (localhost:9000)
main.tf / variables.tf / outputs.tf   демо-ресурс
.env.example         шаблон кред + HOST_PROJECT_DIR
Makefile             прогон с хоста без Jenkins
```

State — в MinIO (`bucket=tfstate`, `key=task2/terraform.tfstate`), локального `terraform.tfstate` не возникает. Креды backend передаются через переменные окружения (`AWS_ACCESS_KEY_ID`/`AWS_SECRET_ACCESS_KEY`), в коде их нет.

Jenkins, MinIO и Terraform — в общей сети `task2-tf-net`. Jenkins запускает Terraform контейнером через docker.sock хоста, поэтому bind-mount указывает на путь хоста из `.env` (`HOST_PROJECT_DIR`; на Windows POSIX-форма `/c/...`).

