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

//S3 Bucket
resource "aws_s3_bucket" "fabes_backend_state" {
    bucket = "dev-fabes-backend-state-in28minutes-abc"
    lifecycle {
           prevent_destroy = true
    }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "fabes_encyption" {
    bucket = aws_s3_bucket.fabes_backend_state.bucket
    rule {
        apply_server_side_encryption_by_default {
              sse_algorithm = "AES256"
        }
    }
}

//Locking -Dynamo DB
resource "aws_dynamodb_table" "fabes_backend_lock" {
    name = "fabes_backend_locks"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
}