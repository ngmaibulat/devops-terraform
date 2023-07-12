
provider "aws" {
  region = var.aws_region
}

data "aws_caller_identity" "current" {}


module "vpc" {
  source          = "./modules/vpc"
  vpc_cidr_block  = "10.0.0.0/16"
  vpc_cidr_subnet = "10.0.0.0/24"
}

# module "storage" {
#   source      = "./modules/storage"
#   bucket_name = "4219688f-1038-490e-962b-01797c59bb52"
#   queue_name  = "hello-queue"
# }
