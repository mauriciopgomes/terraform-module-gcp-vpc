resource "google_compute_subnetwork" "gke" {
  count                    = var.gke_ip_cidr != "" ? 1 : 0
  name                     = "gke"
  ip_cidr_range            = var.gke_ip_cidr[0]
  region                   = var.region
  network                  = google_compute_network.this.id
  private_ip_google_access = true
  project                  = var.gcp_project
  secondary_ip_range [{
    range_name    = "gke-pods"
    ip_cidr_range = var.gke_ip_cidr[1]
  },
  {
    range_name    = "gke-service"
    ip_cidr_range = var.gke_ip_cidr[2]
  },
  ]
}
