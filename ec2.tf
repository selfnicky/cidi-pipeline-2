# Create a key pair for SSH access
resource "aws_key_pair" "dev_key" {
  key_name   = "dev-keypair"
  public_key = tls_private_key.rsa_key.public_key_openssh
}

# Generate RSA key
resource "tls_private_key" "rsa_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save private key to file (for SSH access)
resource "local_file" "private_key" {
  content  = tls_private_key.rsa_key.private_key_pem
  filename = "dev-keypair.pem"
  file_permission = "0400"  # Restrict permissions
}

# EC2 instance with EBS volume
resource "aws_instance" "dev_instance" {
  ami                    = "ami-0c7217cdde317cfec"  # Ubuntu 22.04 LTS in us-east-1
  instance_type          = var.instance_type         # Uses t2.large
  key_name               = aws_key_pair.dev_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  root_block_device {
    volume_size = var.ebs_volume_size
    volume_type = "gp2"
  }

  tags = {
    Name = "dev-instance"
  }
}

# Security group allowing SSH
resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound traffic"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.ssh_cidr_blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}