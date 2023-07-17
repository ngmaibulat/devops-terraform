terraform {
  cloud {
    organization = "example-org-e380b0"

    workspaces {
      name = "getting-started"
      # prefix = "demo-"
    }
  }

  required_version = ">= 1.1.2"
}
