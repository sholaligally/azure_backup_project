output "vault_ids" {
  value = azurerm_recovery_services_vault.myvault[*].id
}

output "vault_names" {
  value = azurerm_recovery_services_vault.myvault[*].name
}