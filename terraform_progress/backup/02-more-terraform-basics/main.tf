variable "iam_user_name_prefix" {
  type    = string #any of number, bool,list, map, set,object, tuple
  default = "rbak_iam_user"
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


resource "aws_iam_user" "rbak_iam_users" {
  count = 3
  name  = "${var.iam_user_name_prefix}_${count.index}"
}
