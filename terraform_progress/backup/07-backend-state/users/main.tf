variable "application_name" {
    default = "07-backend-state"
}

variable "project_name" {
    default = "users"
}

variable "environment" {
    default = "dev"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "dev-fabes-backend-state-in28minutes-abc"
    #key = "${application_name}-${project_name}-${environment}"
    #key = "07-backend-state-users-dev"
    key = "dev/07-backend-state/users/backend-state"
    region = "us-east-1"
    dynamodb_table = "fabes_backend_locks"
    encrypt = true
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_iam_user" "rbak_iam_user" {
    name="${terraform.workspace}_iam_user_abc"
}




