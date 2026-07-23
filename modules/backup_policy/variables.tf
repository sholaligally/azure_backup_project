variable "resource_group_name" {
  type = string
}

variable "recovery_vault_name" {
  type = string
}

variable "timezone" {
  type    = string
  default = "UTC"
}

variable "policies" {
  type = map(object({
    start_time     = string
    retention_days = number
  }))
}