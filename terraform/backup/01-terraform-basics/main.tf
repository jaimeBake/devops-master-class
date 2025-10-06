terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# plan - execute 
resource "aws_s3_bucket" "rbak_s3_bucket" {
    bucket = "rbak-s3-bucket-in28minutes-rbak-001"
}