provider "aws" {
  region = "ap-northeast-1"

  default_tags {
    tags = {
      Stage = "${stage}"
      App   = "${app}"
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
    bucket         = "${app}-${stage}-terraform-state"
    key            = "${path}/terraform.tfstate"
    region         = "ap-northeast-1"
    dynamodb_table = "${app}-state-lock"
    encrypt        = true
  }
}
