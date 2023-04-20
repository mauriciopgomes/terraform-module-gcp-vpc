resource "google_compute_firewall" "this" {
  count         = var.enable_iap ? 1 : 0
  name          = "${var.env}-vpc-allow-ingress-from-iap"
  network       = google_compute_network.this.name
  source_ranges = ["35.235.240.0/20"]
  project       = var.gcp_project

  allow {
    ports    = ["22", "3389"]
    protocol = "tcp"
  }
}
