data "google_project" "project" {}
data "google_compute_default_service_account" "default" {}

resource "google_project_iam_binding" "owner" {
  role = "roles/owner"

  members = [
    "user:andy.shinn@gmail.com",
  ]
}

resource "google_project_iam_binding" "service_account_user" {
  role = "roles/iam.serviceAccountUser"

  members = [
    "user:andy.shinn@gmail.com",
  ]
}

resource "google_project_iam_binding" "os_login_admin" {
  role = "roles/compute.osAdminLogin"

  members = [
    "user:andy.shinn@gmail.com",
  ]
}

resource "google_project_iam_binding" "editor" {
  role = "roles/editor"

  members = [
    "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com",
    "serviceAccount:${data.google_project.project.number}@cloudservices.gserviceaccount.com",
    "serviceAccount:${data.google_compute_default_service_account.default.email}",
    "serviceAccount:service-453728115251@containerregistry.iam.gserviceaccount.com",
  ]
}
