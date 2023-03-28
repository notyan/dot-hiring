resource "google_compute_network" "dot-vpc" {
  name                    = "dot-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "dot-subnet" {
  name          = "dot-subnet"
  ip_cidr_range = "10.0.1.0/24"
  network       = google_compute_network.dot-vpc.id
  region        = var.region
}