output "policy_ids" {
  value = { for name, policy in azurerm_backup_policy_vm.mypolicy : name => policy.id }
}