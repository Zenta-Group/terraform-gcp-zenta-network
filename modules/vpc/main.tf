/******************************************
	VPC configuration
 *****************************************/

/**
 * This resource creates a Google Cloud VPC network.
 * 
 * Parameters:
 * - name: The name of the network.
 * - auto_create_subnetworks: Boolean to specify if subnets should be auto-created.
 * - routing_mode: The network routing mode (e.g., "REGIONAL" or "GLOBAL").
 * - project: The GCP project ID where the network will be created.
 * - description: A description of the network.
 * - delete_default_routes_on_create: Boolean to delete default internet gateway routes.
 * - mtu: The maximum transmission unit for the network.
 * - enable_ula_internal_ipv6: Boolean to enable ULA internal IPv6.
 * - internal_ipv6_range: The range of internal IPv6 addresses.
 */
resource "google_compute_network" "network" {
  name                                      = var.network_name
  auto_create_subnetworks                   = var.auto_create_subnetworks
  routing_mode                              = var.routing_mode
  project                                   = var.project_id
  description                               = var.description
  delete_default_routes_on_create           = var.delete_default_internet_gateway_routes
  mtu                                       = var.mtu
  enable_ula_internal_ipv6                  = var.enable_ipv6_ula
  internal_ipv6_range                       = var.internal_ipv6_range
}
