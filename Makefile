.PHONY: lint fmt init validate plan apply

lint:
	tflint --chdir=terraform --init
	tflint --chdir=terraform --recursive

fmt:
	terraform -chdir=terraform fmt -recursive

init:
	terraform -chdir=terraform init -backend-config=backend.hcl

validate:
	terraform -chdir=terraform validate

plan:
	terraform -chdir=terraform plan -out=plan.out

apply:
	test -f terraform/plan.out
	terraform -chdir=terraform apply plan.out
