provider "google" {
  project = var.project_name
  region  = "us-central1"
  version = "~> 2.15.0"
}

provider "github" {
  organization = var.project_name
  version      = "~> 2.2.1"
}

provider "netlify" {
  version = "~> 0.3.0"
}
