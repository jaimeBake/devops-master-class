variable "names" {
  default = ["ravs","robin","bambi","manu","seho"]
}


terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_iam_user" "rbak_iam_users" {
  #count = length(var.names)
  #name  = var.names[count.index]
  for_each = toset(var.names)
  name = each.value 
}
