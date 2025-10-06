variable "users" {
  default = {
    ravs : { country : "France", department : "Seine et Marne" },
    robin : { country : "Kongo", department : "Bouenza" },
    bambi : { country : "RDC", department : "Mai Ndombe" },
    manu : { country : "Cote Ivoire", department : "Leboutou" },
    seho : { country : "Angola", department : "Zaire" }
  }
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

  for_each = var.users
  name     = each.key
  tags = {
    country : each.value.country
    department : each.value.country
  }
}
