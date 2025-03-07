resource "aws_dynamodb_table" "tf_lock" {
  name           = "tf-lock-myproject-dev"  # Replace "myproject" with your identifier
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  server_side_encryption {
    enabled = true
  }
}