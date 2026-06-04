variable "name_prefix" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "public_subnet" {
  type = any
}

variable "private_subnet" {
  type = any
}

variable "enable_dns_hostnames" {
  type    = bool
  default = true
}

variable "enable_dns_support" {
  type    = bool
  default = true
}

# variable "authentication_mode" {
#   type    = string
# }

# variable "eks_version" {
#   type    = number
# }

# variable "subnet_ids" {
#   type    = any
# }

# variable "eks_policy_attachment" {
#   type = string
# }

variable "application" {
  type = string
}
variable "environment" {
  type = string
}

variable "region" {
  type = string
}

variable "owner" {
  type = string
}

variable "cost_centre" {
  type = string
}

variable "deletion_window_in_days" {
  type = number
}

variable "rotation_period_in_days" {
  type = number
}