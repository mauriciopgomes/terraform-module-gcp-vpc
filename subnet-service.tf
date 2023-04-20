resource "google_compute_subnetwork" "service" {
  count                    = var.service_ip_cidr != "" ? 1 : 0
  name                     = "service"
  ip_cidr_range            = var.service_ip_cidr
  region                   = var.region
  network                  = google_compute_network.this.id
  private_ip_google_access = true
  project                  = var.gcp_project
}
