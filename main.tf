// Configure the Google Cloud provider

provider "google" {
 credentials = file("practice-project-305403-5b105ab9fb42.json")
 project     = var.gcp_project
 region      = var.region
 zone        = "us-central1-c"
}


resource "google_compute_instance" "vm_instance" {
  name         = var.instance_name
  machine_type = var.my_inst_type
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
  network_interface {
    network            = google_compute_network.vpc.self_link
    subnetwork         = google_compute_subnetwork.subnet.self_link
    access_config {
    }
  }
}

// Create VPC
resource "google_compute_network" "vpc" {
 name                    = var.name
 auto_create_subnetworks = "false"
}

// Create Subnet
resource "google_compute_subnetwork" "subnet" {
 name          = var.subnet_name
 ip_cidr_range = var.subnet_cidr
 network       = google_compute_network.vpc.name
 region        = var.subnet_region
}


// VPC firewall configuration

resource "google_compute_firewall" "firewall" {
  name    = var.name
  network = google_compute_network.vpc.name

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
}
