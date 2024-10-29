terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "5.73.0"
      }
    }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "ec2" {
  count = var.instance_count
  ami = var.ami
  instance_type = var.instance_type 
  subnet_id = var.subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "sharukh-${var.my_env}"
  }
}

output "ip" {
  value = aws_instance.ec2[*].public_ip
}
