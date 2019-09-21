resource "google_kms_key_ring" "packer" {
  name     = "packer"
  location = "global"
}

resource "google_kms_crypto_key" "buildkite" {
  name     = "buildkite"
  key_ring = google_kms_key_ring.packer.self_link

  lifecycle {
    prevent_destroy = true
  }
}

resource "google_kms_crypto_key_iam_binding" "decrypter" {
  crypto_key_id = google_kms_crypto_key.buildkite.self_link
  role          = "roles/cloudkms.cryptoKeyDecrypter"

  members = [
    "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com",
    "serviceAccount:${data.google_compute_default_service_account.default.email}",
  ]
}
