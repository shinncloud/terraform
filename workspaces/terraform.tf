terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "shinncloud"

    workspaces {
      prefix = "infra-"
    }
  }
}
