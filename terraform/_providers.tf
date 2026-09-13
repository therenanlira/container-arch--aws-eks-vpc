terraform {
  required_version = "~> 1.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  allowed_account_ids = [var.account_id]
  region              = var.region
  default_tags {
    tags = local.tags
  }
}
