output "ec2_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.dev_instance.public_ip
}

output "instance_type" {
  description = "Type of the EC2 instance"
  value       = aws_instance.dev_instance.instance_type
}