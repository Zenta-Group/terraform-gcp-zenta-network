/******************************************
	VPC configuration
 *****************************************/
resource "google_compute_network" "network" {
  name                                      = "vpc-network-${var.application_name}-${var.environment}"
  auto_create_subnetworks                   = var.auto_create_subnetworks
  routing_mode                              = var.routing_mode
  project                                   = var.project_id
  delete_default_routes_on_create           = var.delete_default_internet_gateway_routes
  mtu                                       = var.mtu
  enable_ula_internal_ipv6                  = var.enable_ipv6_ula
  internal_ipv6_range                       = var.internal_ipv6_range
}
