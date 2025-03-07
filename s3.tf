resource "aws_s3_bucket" "tf_state" {
  bucket = "tf-state-myproject-dev-123"  # Replace with a unique name
  force_destroy = true  # Caution: Allows bucket deletion even if not empty
}

resource "aws_s3_bucket_versioning" "state_versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "state_encryption" {
  bucket = aws_s3_bucket.tf_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}