output "vault_ids" {
  description = "IDs of all created Recovery Services Vaults"
  value       = module.rsv.vault_ids
}

output "vault_names" {
  description = "Names of all created Recovery Services Vaults"
  value       = module.rsv.vault_names
}

output "backup_policy_ids" {
  description = "IDs of all created backup policies"
  value       = module.backup_policy.policy_ids
}

output "protected_vm_ids" {
  description = "IDs of VMs enrolled in backup protection"
  value       = module.vm_backup.protected_vm_ids
}