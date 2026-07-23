output "protected_vm_ids" {
  value = { for name, vm in azurerm_backup_protected_vm.myvm : name => vm.id }
}