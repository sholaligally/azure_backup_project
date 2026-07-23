# Discover VMs matching the backup tag
data "azurerm_resources" "tagged_vms" {
  type = "Microsoft.Compute/virtualMachines"

  required_tags = {
    (var.backup_tag_key) = var.backup_tag_value
  }
}

resource "azurerm_backup_protected_vm" "myvm" {
  for_each = { for vm in data.azurerm_resources.tagged_vms.resources : vm.name => vm }

  resource_group_name = var.resource_group_name
  recovery_vault_name = var.recovery_vault_name
  source_vm_id        = each.value.id
  backup_policy_id    = var.backup_policy_id
}