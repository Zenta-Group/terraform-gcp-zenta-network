output "network_name" {
  value       = module.zenta-network.network_name
  description = "The name of the VPC being created"
}

output "network_self_link" {
  value       = module.zenta-network.self_link
  description = "The URI of the VPC being created"
}

output "project_id" {
  value       = module.zenta-network.project_id
  description = "VPC project id"
}
