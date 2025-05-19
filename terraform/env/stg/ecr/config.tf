provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Stage = "stg"
      App   = "app_name"
    }
  }
}

terraform {
  required_version = "1.12.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.00"
    }
  }

  backend "s3" {
    bucket         = "app_name-stg-terraform-state"
    key            = "stg/ecr/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "app_name-state-lock"
    encrypt        = true
  }
}
