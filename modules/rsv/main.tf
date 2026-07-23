resource "azurerm_recovery_services_vault" "myvault" {
  count = var.rsv_count

  name                = "${var.vault_name_prefix}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "Standard"
  storage_mode_type   = var.redundancy
  soft_delete_enabled = true

  tags = var.tags
}