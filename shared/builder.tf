resource "google_compute_health_check" "builder_goss" {
  name                = "builder-goss"
  check_interval_sec  = 10
  timeout_sec         = 5
  healthy_threshold   = 2
  unhealthy_threshold = 5

  http_health_check {
    port         = 8080
    proxy_header = "NONE"
    request_path = "/healthz"
  }
}

resource "google_compute_instance_template" "builder" {
  name         = var.instance_template_builders
  machine_type = "n1-standard-1"

  network_interface {
    network = "default"

    access_config {
      // Empty creates ephemral IP
    }
  }

  service_account {
    email = "default"
    scopes = [
      "https://www.googleapis.com/auth/devstorage.full_control",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring.write",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append",
      "https://www.googleapis.com/auth/cloudkms",
      "https://www.googleapis.com/auth/compute",
    ]
  }

  disk {
    source_image = var.source_image_builders
    auto_delete  = true
    boot         = true
    disk_size_gb = 50
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_region_instance_group_manager" "builders" {
  name               = "builders"
  base_instance_name = "builders"
  region             = "us-central1"
  target_size        = 2
  instance_template  = google_compute_instance_template.builder.self_link
}
