/******************************************
	GLOBAL Environment START
 *****************************************/
variable "project_id" {
  description = "The ID of the project where this VPC will be created"
  type        = string
}

variable "environment" { 
  description = "values: dev, staging, prod, etc. (default 'dev')"
  type        = string
  validation {
    condition     = can(regex("^(dev|stg|prod|qa|uat)$", var.environment))
    error_message = "The environment must be one of: dev, staging, prod, qa, uat."
  }
  default = "dev" 
}
variable "application_name" { 
  default = "system" 
  description = "The name of the application using this VPC. This is used to create a unique network name."
}
/******************************************
	GLOBAL Environment END
 *****************************************/


/******************************************
	VPC Networking Environment START
 *****************************************/
variable "network_name" {
  description = "The name of the network being created"
  type        = string
}
variable "auto_create_subnetworks" {
  type        = bool
  description = "When set to true, the network is created in 'auto subnet mode' and it will create a subnet for each region automatically across the 10.128.0.0/9 address range. When set to false, the network is created in 'custom subnet mode' so the user can explicitly connect subnetwork resources."
  default     = false
}
variable "routing_mode" {
  type        = string
  default     = "GLOBAL"
  description = "The network routing mode (default 'GLOBAL')"
}
variable "delete_default_internet_gateway_routes" {
  type        = bool
  description = "If set, ensure that all routes within the network specified whose names begin with 'default-route' and with a next hop of 'default-internet-gateway' are deleted"
  default     = false
}

variable "mtu" {
  type        = number
  description = "The network MTU (If set to 0, meaning MTU is unset - defaults to '1460'). Recommended values: 1460 (default for historic reasons), 1500 (Internet default), or 8896 (for Jumbo packets). Allowed are all values in the range 1300 to 8896, inclusively."
  default     = 0
}

variable "enable_ipv6_ula" {
  type        = bool
  description = "Enabled IPv6 ULA, this is a permanent change and cannot be undone! (default 'false')"
  default     = false
}

variable "internal_ipv6_range" {
  type        = string
  default     = null
  description = "When enabling IPv6 ULA, optionally, specify a /48 from fd20::/20 (default null)"
}

/******************************************
  VPC Networking Environment END
 *****************************************/


/******************************************
  Subnets Environment START
 *****************************************/
variable "subnets" {
  type = list(object({
    subnet_name                      = string
    subnet_ip                        = string
    subnet_region                    = string
    subnet_private_access            = optional(string)
    subnet_private_ipv6_access       = optional(string)
    description                      = optional(string)
  }))
  description = "The list of subnets being created"
}
/******************************************
  Subnets Environment END
 *****************************************/


/******************************************
  Firewall rules Environment START
 *****************************************/
variable "firewall_rules" {
  type = list(object({
    name                    = string
    description             = optional(string, null)
    direction               = optional(string, "INGRESS")
    disabled                = optional(bool, null)
    priority                = optional(number, null)
    ranges                  = optional(list(string), [])
    source_tags             = optional(list(string))
    source_service_accounts = optional(list(string))
    target_tags             = optional(list(string))
    target_service_accounts = optional(list(string))

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    log_config = optional(object({
      metadata = string
    }))
  }))
  description = "This is DEPRECATED and available for backward compatibility. Use ingress_rules and egress_rules variables. List of firewall rules"
  default     = []
}

variable "ingress_rules" {
  description = "List of ingress rules. This will be ignored if variable 'rules' is non-empty"
  default     = []
  type = list(object({
    name                    = string
    description             = optional(string, null)
    disabled                = optional(bool, null)
    priority                = optional(number, null)
    destination_ranges      = optional(list(string), [])
    source_ranges           = optional(list(string), [])
    source_tags             = optional(list(string))
    source_service_accounts = optional(list(string))
    target_tags             = optional(list(string))
    target_service_accounts = optional(list(string))

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    log_config = optional(object({
      metadata = string
    }))
  }))
}

variable "egress_rules" {
  description = "List of egress rules. This will be ignored if variable 'rules' is non-empty"
  default     = []
  type = list(object({
    name                    = string
    description             = optional(string, null)
    disabled                = optional(bool, null)
    priority                = optional(number, null)
    destination_ranges      = optional(list(string), [])
    source_ranges           = optional(list(string), [])
    source_tags             = optional(list(string))
    source_service_accounts = optional(list(string))
    target_tags             = optional(list(string))
    target_service_accounts = optional(list(string))

    allow = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    deny = optional(list(object({
      protocol = string
      ports    = optional(list(string))
    })), [])
    log_config = optional(object({
      metadata = string
    }))
  }))
}


variable "network_firewall_policy_enforcement_order" {
  type        = string
  default     = null
  description = "Set the order that Firewall Rules and Firewall Policies are evaluated. Valid values are `BEFORE_CLASSIC_FIREWALL` and `AFTER_CLASSIC_FIREWALL`. (default null or equivalent to `AFTER_CLASSIC_FIREWALL`)"
}



