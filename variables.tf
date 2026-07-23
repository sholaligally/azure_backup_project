variable "rsv_count" {
  description = "Number of Recovery Services Vaults to create"
  type        = number
  default     = 3
}

variable "vault_name_prefix" {
  description = "Prefix used to name each Recovery Services Vault"
  type        = string
  default     = "rsv-backup"
}

variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "eastus"
}

variable "resource_group_name" {
  description = "Name of the resource group to create/use"
  type        = string
  default     = "rg-backup-01"
}

variable "redundancy" {
  description = "Storage redundancy for the vaults: GeoRedundant, LocallyRedundant, or ZoneRedundant"
  type        = string
  default     = "LocallyRedundant"

  validation {
    condition     = contains(["LocallyRedundant", "ZoneRedundant", "GeoRedundant"], var.redundancy)
    error_message = "redundancy must be one of: GeoRedundant, LocallyRedundant, or ZoneRedundant."
  }
}

variable "timezone" {
  description = "Timezone used for backup schedules"
  type        = string
  default     = "UTC"
}

variable "policies" {
  description = "Map of backup policies: name => { start_time, retention_days }"
  type = map(object({
    start_time     = string
    retention_days = number
  }))
  default = {
    "policy-1" = { start_time = "18:00", retention_days = 30 }
    "policy-2" = { start_time = "22:00", retention_days = 30 }
    "policy-3" = { start_time = "02:00", retention_days = 30 }
  }
}

variable "backup_tag_key" {
  description = "Tag key used to identify VMs that should be backed up"
  type        = string
  default     = "isBackup"
}

variable "backup_tag_value" {
  description = "Tag value that enables backup"
  type        = string
  default     = "Enable"
}

variable "tags" {
  description = "Common tags applied to created resources"
  type        = map(string)
  default = {
    isProcessed = "Yes"
  }
}