variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.large"
}

variable "ebs_volume_size" {
  description = "EBS volume size in GB"
  default     = 10
}

variable "ssh_cidr_blocks" {
  description = "Allowed IPs for SSH access"
  default     = ["0.0.0.0/0"]  # Restrict this to your IP in production!
}