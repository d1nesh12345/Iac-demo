resource "google_compute_instance_group" "test_grp" {
  name      = "test-instance-group"
  zone      = "us-central1-a"
  instances = [google_compute_instance.default1.id, google_compute_instance.default1.id]
  named_port {
    name = "http"
    port = "8080"
  }

  named_port {
    name = "https"
    port = "8443"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "google_compute_instance" "default1" {
  name         = "test1"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo1", "bar1"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
 // scratch_disk {
  //  interface = "SCSI"
 // }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar1"
  }

  metadata_startup_script = "echo hi > /test.txt"

}

resource "google_compute_instance" "default2" {
  name         = "test2"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  tags = ["foo2", "bar2"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
 // scratch_disk {
  //  interface = "SCSI"
 // }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar2"
  }

  metadata_startup_script = "echo hi > /test.txt"

}
