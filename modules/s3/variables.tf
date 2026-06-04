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