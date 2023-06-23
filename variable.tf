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
  default     = "teerfaomr_vpc-lawplabs"
}

variable "web_server_name" {
  type        = string
  description = "Name for the instance created as web server"
}

variable "inbound_rules_web" {
  description = "ingress rule for security group of web server"
  type = list(object({
    port        = number
    description = string
    protocol    = string
    cidr_range = list(string)
  }))

  default = [{
    port        = 22
    description = "This is for ssh connection"
    protocol    = "tcp"
    },
    {
      port        = 80
      description = "this is for web hosting"
      protocol    = "tcp"
  }]
}