/******************************************
	VPC configuration
 *****************************************/
module "vpc" {
  source                                    = "./modules/vpc"
  network_name                              = var.network_name
  auto_create_subnetworks                   = var.auto_create_subnetworks
  routing_mode                              = var.routing_mode
  project_id                                = var.project_id
  description                               = var.description
  shared_vpc_host                           = var.shared_vpc_host
  delete_default_internet_gateway_routes    = var.delete_default_internet_gateway_routes
  mtu                                       = var.mtu
  enable_ipv6_ula                           = var.enable_ipv6_ula
  internal_ipv6_range                       = var.internal_ipv6_range
  network_firewall_policy_enforcement_order = var.network_firewall_policy_enforcement_order
  network_profile                           = var.network_profile
  bgp_always_compare_med                    = var.bgp_always_compare_med
  bgp_best_path_selection_mode              = var.bgp_best_path_selection_mode
  bgp_inter_region_cost                     = var.bgp_inter_region_cost
}
