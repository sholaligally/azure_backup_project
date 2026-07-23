resource "azurerm_backup_policy_vm" "mypolicy" {
  for_each = var.policies

  name                = each.key
  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name
  timezone            = var.timezone

  backup {
    frequency = "Daily"
    time      = each.value.start_time
  }

  retention_daily {
    count = each.value.retention_days
  }
}