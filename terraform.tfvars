rsv_count           = 3
location            = "eastus"
resource_group_name = "rg-backup-01"
vault_name_prefix   = "rsv-backup"
redundancy          = "LocallyRedundant"
timezone            = "UTC"

policies = {
  "policy-1" = { start_time = "18:00", retention_days = 30 }
  "policy-2" = { start_time = "22:00", retention_days = 30 }
  "policy-3" = { start_time = "02:00", retention_days = 30 }
}

backup_tag_key   = "isBackup"
backup_tag_value = "Enable"

tags = {
  isBackup    = "Enable"
  isProcessed = "Yes"
}