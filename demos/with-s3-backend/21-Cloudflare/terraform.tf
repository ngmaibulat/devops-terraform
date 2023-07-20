terraform {

  required_providers {

    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }

  }

  backend "s3" {
    bucket = "ngm-tfstate"
    key    = "demos/cloudflare/terraform.tfstate"
    region = "eu-central-1"
  }

  required_version = "> 1.5.0"
}

provider "cloudflare" {
  api_token = var.cloudflare_api_token
}
