terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "> 4.66.0"
    }

  }

  required_version = "> 1.5.0"
}


provider "aws" {
  region = var.aws_region
}
