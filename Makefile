.PHONY: init plan apply destroy

init:
	@echo "Initializing Terraform..."
	cd infrastructure/dev && terraform init

plan:
	@echo "Generating Terraform plan..."
	cd infrastructure/dev && terraform plan -out=tfplan

apply:
	@echo "Applying Terraform changes..."
	cd infrastructure/dev && terraform apply -auto-approve tfplan

destroy:
	@echo "Destroying infrastructure..."
	cd infrastructure/dev && terraform destroy -auto-approve