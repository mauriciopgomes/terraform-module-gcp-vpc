variable "region" {
  description = "GCP Region"
}
variable "env" {
  description = "Environment"
}
variable "gcp_project" {
  description = "Google Cloud Project Name"
}
variable "enable_iap" {
  description = "Enable IAP Access on this Network"
  default     = false
}
variable "enable_nat" {
  description = "Enable NAT Access on this Network"
  default     = false
}
variable "private_ip_cidr" {
  description = "Create Private Network"
  default     = ""
}
variable "service_ip_cidr" {
  description = "Create Service Network"
  default     = ""
}
variable "gke_ip_cidr" {
  description = "Create GKE Network"
  default     = ""
}
