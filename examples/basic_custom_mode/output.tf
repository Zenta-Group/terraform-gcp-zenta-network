output "network_name" {
  value       = google_compute_network.network.name
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = google_compute_network.network.self_link
  description = "The URI of the VPC being created"
}

output "project_id" {
  value       = google_compute_network.network.project
  description = "VPC project id"
}

output "auto_create_subnetworks" {
  value       = google_compute_network.network.auto_create_subnetworks
  description = "The value of the auto mode setting"
}
