variable "environment" {
   default = "default"
}

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

resource "aws_iam_user" "rbak_iam_user" {
    name="${local.iam_user_extension}_${var.environment}"
}

locals {
  iam_user_extension = "my_iam_user_abc"
}


