# Terraform Settings Block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.57.0" # Optional but recommended in production
    }
  }

  # Backend Block - Remote State Storage
  # backend "s3" {
  #   bucket = "terraform-remote-state-2024" # S3 Bucket Name
  #   key    = "terraform-remote-state-2024" # S3 Bucket Object Key
  #   region = "eu-central-1" # S3 Bucket Region
  # }
}

# Provider Block
provider "aws" {
  # Arguments
  profile = "default" # AWS Credentials Profile configured on your local desktop terminal  $HOME/.aws/credentials
  region  = "eu-central-1"
}
