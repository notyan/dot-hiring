
resource "google_compute_instance" "dot-instance" {
  name         = "dot-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-c"
  tags = ["dot-port", "default-allow-ssh"]
  
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2204-lts"
      size  = "25"
    }
  }

  network_interface {
    network    = google_compute_network.dot-vpc.id
    subnetwork = google_compute_subnetwork.dot-subnet.id
    access_config {
    }
  }
}