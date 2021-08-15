terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_vpc" "VPC-TC" {
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "VPC-TC"
  }
}

resource "aws_s3_bucket" "S3Bucket-TC" {
   lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "log/"

    tags = {
      rule = "log"
      autoclean = "true"
    }

    transition {
      days = 90
      storage_class = "GLACIER"
    }

    expiration {
      days = 91
    }
  }

  tags = {
    Name = "S3Bucket-TC"
  }
}

