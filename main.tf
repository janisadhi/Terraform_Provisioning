terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~>5.0"
    }
  }

  required_version = ">=1.4.0"
}

provider "aws" {
  region     = "us-east-1"
  
}

resource "aws_instance" "first_instance" {
  ami           = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
 

  tags = {
    Name = "awsLinux"
  }
}

resource "aws_security_group" "demo_security_group" {
  name        = "terraform_group"
  description = "Security group with SSH, HTTP, and HTTPS access"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
}
