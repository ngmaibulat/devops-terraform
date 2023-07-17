# terraform {
#   cloud {
#     organization = "example-org-e380b0"

#     workspaces {
#       name = "getting-started"
#     }
#   }

#   required_version = ">= 1.1.2"
# }


terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "example-org-e380b0"

    workspaces {
      name = "demo-workspace"
      # prefix = "demo-"
    }
  }
}
