terraform {
  required_version = "~> 1.1.0"

  backend "s3" {
    bucket = "terraform-state-twoqubed"
    key    = "recipes/terraform.tfstate"
    region = "us-east-2"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.70.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}
