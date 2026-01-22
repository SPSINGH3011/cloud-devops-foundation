resource "azurerm_storage_account" "storage" {
  name                     = "storageacrevoskmss"
  resource_group_name      = "revision-rg5"
  location                 = "central india"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}