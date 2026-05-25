variable "name_prefix" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "enable_dns_hostnames" {
  type = bool
}

variable "enable_dns_support" {
  type = bool
}

variable "public_subnet" {
  type = any
}

variable "private_subnet" {
  type = any
}