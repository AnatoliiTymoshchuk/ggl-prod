// Configure the Google Cloud provider
provider "google" {
  region      = "europe-west1"
}
// Create a new instance
resource "google_compute_instance" "default" {
 //project      = "${google_project_services.project.project}"
 zone         = "europe-west1-b"
 name         = "${var.vm_name}"
 machine_type = "f1-micro"
 boot_disk {
   initialize_params {
     image = "Ubuntu16.04_64-bit"
   }
 }
 network_interface {
   network = "default"
   access_config {
    // leave empty to create a new Ephemeral IP
   }
 }
}
variable "vm_name" {
  description = "Name for VM to be created"
}
output "instance_id" {
 value = "${google_compute_instance.default.self_link}"
}
