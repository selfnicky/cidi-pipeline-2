# Uncomment after initial setup (run `terraform init -migrate-state` later)
/*
terraform {
  backend "s3" {
    bucket         = "tf-state-<YOUR-PROJECT>-dev"  # Replace with your bucket name
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tf-lock-<YOUR-PROJECT>-dev"   # Replace with your DynamoDB table
    encrypt        = true
  }
}
*/