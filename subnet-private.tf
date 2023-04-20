resource "google_compute_subnetwork" "private" {
  count                    = var.private_ip_cidr != "" ? 1 : 0
  name                     = "private"
  ip_cidr_range            = var.private_ip_cidr
  region                   = var.region
  network                  = google_compute_network.this.id
  private_ip_google_access = true
  project                  = var.gcp_project
}
