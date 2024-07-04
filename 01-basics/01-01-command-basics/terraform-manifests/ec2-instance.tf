# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57.0" # Optional but recommended in production
    }
  }
}

# Provider Block
provider "aws" {
  # Arguments
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "eu-central-1"
}

# Resource Block
resource "aws_instance" "ec2demo" {
  ami           = "ami-0910ce22fbfa68e1d" # Amazon Linux in eu-west-1, update as per your region
  instance_type = "t2.micro"

  tags = {
    Name = "ec2demo"
  }
}
