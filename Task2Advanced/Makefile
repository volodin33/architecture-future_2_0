TF = docker run --rm --network task2-tf-net --env-file .env \
     -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY \
     -v "$(CURDIR)":/work -w /work hashicorp/terraform

.PHONY: up down fmt init validate plan apply destroy

up:
	docker compose up -d

down:
	docker compose down

fmt:
	$(TF) fmt -check -recursive

init:
	$(TF) init -backend-config=backend.tfvars

validate: init
	$(TF) validate

plan: init
	$(TF) plan -out=tfplan

apply: plan
	@echo "Применить изменения? Нажмите Enter для продолжения или Ctrl+C для отмены."
	@read _
	$(TF) apply tfplan

destroy:
	$(TF) destroy -auto-approve
