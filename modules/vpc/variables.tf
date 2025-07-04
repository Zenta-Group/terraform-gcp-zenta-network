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