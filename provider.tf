terraform {
  required_version = ">1.4"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0.0"
    }
  }
  backend "s3" {
    bucket         = "terraformstatefilestorelwplabs"
    key            = "terraform-state-file-june-23"
    region         = "us-east-1"
    role_arn       = "arn:aws:iam::520464532822:role/stsassumerole"
    dynamodb_table = "terraformstatetable"
  }
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::520464532822:role/stsassumerole"
    session_name = "terraform-sts"
  }
}

