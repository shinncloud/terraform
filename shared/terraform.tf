terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "shinncloud"

    workspaces {
      name = "shared"
    }
  }
}
