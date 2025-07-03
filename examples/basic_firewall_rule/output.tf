output "firewall_rules" {
  description = "The list of created firewall rules"
  value       = module.firewall_rules.firewall_rules
}
