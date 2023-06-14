variable "cidr_for_vpc" {
  description = "cidr range for vpc"
  type        = string
}

variable "tenancy" {
  description = "Instance tenancy for instances launced in this vpc"
  type        = string
  default     = "default"
}

variable "dns_hostnames_enabled" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type        = bool
  default     = false
}

variable "dns_support_enabled" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type        = bool
  default     = true
}

variable "vpc_name" {
  type        = string
  description = "Name for the vpc"
}
