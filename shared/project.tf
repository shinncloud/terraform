resource "google_compute_project_metadata_item" "os_login" {
  key   = "enable-oslogin"
  value = "TRUE"
}
