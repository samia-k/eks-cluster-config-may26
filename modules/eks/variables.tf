variable "name_prefix" {
  type = string
}

variable "authentication_mode" {
  type = string
}

variable "eks_version" {
  type = number
}

variable "private_subnet_ids" {
  type = any
}

variable "eks_policy_attachment" {
  type = string
}

variable "eks_cluster_role" {
  type = string
}