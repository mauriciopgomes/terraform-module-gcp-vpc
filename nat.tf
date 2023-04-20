resource "google_compute_address" "this" {
  count   = var.enable_nat ? 1 : 0
  name    = "${var.env}-nat-ip"
  region  = var.region
  project = var.gcp_project
}

resource "google_compute_router" "this" {
  count   = var.enable_nat ? 1 : 0
  name    = "${var.env}-router"
  network = google_compute_network.this.name
  region  = var.region
  project = var.gcp_project
}

resource "google_compute_router_nat" "this" {
  count                              = var.enable_nat ? 1 : 0
  name                               = "${var.env}-router-nat"
  router                             = google_compute_router.this[0].name
  region                             = var.region
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = google_compute_address.this[0].*.self_link
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
  project                            = var.gcp_project

  log_config {
    enable = true
    filter = "ERRORS_ONLY"
  }
}
