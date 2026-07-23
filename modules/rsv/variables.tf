variable "rsv_count" {
  type = number
}

variable "vault_name_prefix" {
  type = string
}

variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "redundancy" {
  type    = string
  default = "LRS"
}

variable "tags" {
  type = map(string)
  default = {
    env   = "dev"
    owner = "ylig"
  }
}