terraform {

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "> 4.66.0"
    }

    tls = {
      source  = "hashicorp/tls"
      version = "~> 4"
    }

    random = {
      source  = "hashicorp/random"
      version = "> 3.5.0"
    }

    archive = {
      source  = "hashicorp/archive"
      version = "> 2.3.0"
    }
  }

  required_version = "> 1.5.0"
}
