terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstatebackupezlinks1"
    container_name       = "tfstate"
    key                  = "azure-backup-project.tfstate"
  }
}