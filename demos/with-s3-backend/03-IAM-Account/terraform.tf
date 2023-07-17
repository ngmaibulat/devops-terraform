terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "> 4.66.0"
    }

  }

  backend "s3" {
    bucket = "ngm-tfstate"
    key    = "demos/account/terraform.tfstate"
    region = "eu-central-1"
  }

  required_version = "> 1.5.0"
}


provider "aws" {
  region = var.aws_region
}
