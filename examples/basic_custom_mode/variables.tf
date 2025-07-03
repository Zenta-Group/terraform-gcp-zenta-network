variable "project_id" {
  description = "The project ID to host the network in"
  type        = string
}

variable "network_name" {
  description = "The name of the network being created"
  type        = string
}

variable "routing_mode" {
  description = "The network routing mode (default 'GLOBAL')"
  type        = string
  default     = "GLOBAL"
}

variable "auto_create_subnetworks" {
  description = "Whether to create subnetworks automatically"
  type        = bool
  default     = false
}