# Infrastructure Pipeline with Terraform and Jenkins

Automate AWS infrastructure provisioning using Terraform and Jenkins.

## Project Structure
```
<!-- Paste the repository structure here -->
```

## Prerequisites
- Terraform `1.5.7`
- AWS CLI configured with credentials
- Jenkins server with plugins: `Pipeline`, `Credentials Binding`

## Setup
1. Clone the repo:
   ```bash
   git clone https://github.com/your-username/your-project.git
   cd your-project
   ```

2. Initialize Terraform (Dev environment):
   ```bash
   cd infrastructure/dev
   terraform init
   ```

3. Replace placeholders:
   - Update `backend.tf` with your S3 bucket and DynamoDB table names.
   - Adjust `variables.tf` (e.g., `ssh_cidr_blocks`).

4. Run Terraform:
   ```bash
   terraform plan -out=tfplan
   terraform apply tfplan
   ```

## Jenkins Pipeline
1. Add credentials to Jenkins:
   - `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`
   - `INFRACOST_API_KEY`

2. Create a Pipeline job and link to this repository’s `Jenkinsfile`.

## Destroy Resources
```bash
terraform destroy -auto-approve
```

## License
MIT