resource "google_compute_address" "static_ip" {
  name = "dot-static-ip"
}

resource "google_compute_instance" "dot-instance" {
  name         = "dot-instance"
  machine_type = "e2-micro"
  zone         = "us-central1-c"
  tags = ["dot-port"]

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
    startup-script = "sudo sed -i 's/#Port 22/Port 11727/g' /etc/ssh/sshd_config && sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config && sudo systemctl restart sshd"

  }

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
       nat_ip = google_compute_address.static_ip.address
    }
  }
}

resource "google_compute_firewall" "dot-port-firewall" {
  name    = "dot-port-firewall"
  network = google_compute_network.dot-vpc.id
  allow {
    protocol = "tcp"
    ports    = ["443", "39209", "11727", "80", "3306", "20", "21", "22"]
  }
  source_ranges = ["0.0.0.0/0"]
  target_tags = ["dot-port"]
}