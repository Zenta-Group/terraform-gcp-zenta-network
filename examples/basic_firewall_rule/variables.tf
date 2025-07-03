variable "project_id" {
  description = "The ID of the project where the firewall rule will be created"
  type        = string
}

variable "network_name" {
  description = "The name of the VPC network where the firewall rule will be applied"
  type        = string
}

variable "rules" {
  description = "List of firewall rules to create"
  type = list(object({
    name        = string
    direction   = string
    priority    = number
    ranges      = list(string)
    allow       = list(object({
      protocol = string
      ports    = list(string)
    }))
  }))
}
