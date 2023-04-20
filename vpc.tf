resource "google_compute_network" "this" {
  name                    = var.env
  auto_create_subnetworks = false
  project                 = var.gcp_project
}
