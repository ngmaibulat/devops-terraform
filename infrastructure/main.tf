
provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}

module "key" {
  source    = "./modules/key"
  algorithm = "RSA"
  bits      = 4096
  name      = var.key_name
}


module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr_block  = "10.0.0.0/16"
  vpc_cidr_subnet = "10.0.0.0/24"
  key_name        = var.key_name

  depends_on = [module.key]
}

# module "storage" {
#   source      = "./modules/storage"
#   bucket_name = "4219688f-1038-490e-962b-01797c59bb52"
#   queue_name  = "hello-queue"
# }
