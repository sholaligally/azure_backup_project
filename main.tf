resource "azurerm_resource_group" "backup_rg" {
  name     = var.resource_group_name
  location = var.location
}

module "rsv" {
  source = "./modules/rsv"

  rsv_count           = var.rsv_count
  vault_name_prefix   = var.vault_name_prefix
  location            = var.location
  resource_group_name = azurerm_resource_group.backup_rg.name
  redundancy          = var.redundancy
  tags                = var.tags
}

module "backup_policy" {
  source = "./modules/backup_policy"

  resource_group_name = azurerm_resource_group.backup_rg.name
  recovery_vault_name = module.rsv.vault_names[0]
  timezone            = var.timezone
  policies            = var.policies
}

module "vm_backup" {
  source = "./modules/vm_backup"

  resource_group_name = azurerm_resource_group.backup_rg.name

  #distribute only to the first vault created
  recovery_vault_name = module.rsv.vault_names[0]
  backup_policy_id    = module.backup_policy.policy_ids["policy-1"]
  backup_tag_key      = var.backup_tag_key
  backup_tag_value    = var.backup_tag_value
}